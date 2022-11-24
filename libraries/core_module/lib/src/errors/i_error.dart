import 'package:flutter/cupertino.dart';

abstract class IError implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final String? error;

  IError({required this.message, this.stackTrace, this.error}) {
    if (stackTrace != null) {
      debugPrintStack(label: message, stackTrace: stackTrace);
    }
  }
}

class DomainError extends IError {
  DomainError({required super.message, super.stackTrace, super.error});
}

class DatasourceError extends IError {
  DatasourceError({required super.message, super.stackTrace, super.error});
}
