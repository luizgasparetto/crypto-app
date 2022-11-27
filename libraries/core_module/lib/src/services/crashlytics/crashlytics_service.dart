import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  static Future<void> initialize() async {
    try {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
        FirebaseCrashlytics.instance.recordFlutterError(details);
      };

      Isolate.current.addErrorListener(ErrorReport.isolateErrorListener);
    } catch (error, stackTrace) {
      log("Couldn't load Crashlytics", stackTrace: stackTrace, error: error);
    }
  }

  static Future<void> recordError(dynamic exception, StackTrace? stack) async {
    try {
      await FirebaseCrashlytics.instance.recordError(exception, stack);
    } catch (error, stackTrace) {
      log("Couldn't record this error", error: error, stackTrace: stackTrace);
    }
  }
}

class ErrorReport {
  static Future<void> _report(dynamic exception, StackTrace stackTrace, String tag) async {
    if (!Platform.environment.containsKey('FLUTTER_TEST') && exception != null) {
      await FirebaseCrashlytics.instance.setCustomKey(tag, exception.toString());
      await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    }
  }

  static void externalFailureError(dynamic exception, StackTrace? stackTrace, String? reportTag) {
    if (stackTrace != null && reportTag != null) {
      _report(exception, stackTrace, 'EXTERNAL_FAILURE: $reportTag');
    }
  }

  static SendPort get isolateErrorListener {
    return RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      final exception = errorAndStacktrace[0];
      final stackTrace = errorAndStacktrace[1];
      await _report(exception, stackTrace, 'ISOLATE');
    }).sendPort;
  }
}
