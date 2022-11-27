import 'package:core_module/core.dart';
import 'package:flutter/cupertino.dart';

abstract class IError implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final dynamic error;

  IError({required this.message, this.stackTrace, this.error}) {
    if (stackTrace != null) {
      debugPrintStack(label: message, stackTrace: stackTrace);
    }

    ErrorReport.externalFailureError(error, stackTrace, message);
  }
}

class DomainError extends IError {
  DomainError({required super.message, super.stackTrace, super.error});
}

class DatasourceError extends IError {
  DatasourceError({required super.message, super.stackTrace, super.error});
}

class AuthError extends IError {
  AuthError({required super.message, super.stackTrace, super.error});
}
