import 'dart:async';

import 'package:core_module/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:dependencies_module/dependencies_module.dart';

import 'package:crypto_app/src/app_module.dart';
import 'package:crypto_app/src/app_widget.dart';

T tripleResolverCallback<T extends Object>() => Modular.get<T>();

Future<void> bootstrap() async {
  TripleObserver.addListener((triple) => log('Triple Observer: ${triple.runtimeType} ${triple.state}'));

  setTripleResolver(tripleResolverCallback);

  await Firebase.initializeApp();

  runZonedGuarded(
    () async {
      await CrashlyticsService.initialize();

      runApp(ModularApp(module: AppModule(), child: const AppWidget()));
    },
    CrashlyticsService.recordError,
  );
}
