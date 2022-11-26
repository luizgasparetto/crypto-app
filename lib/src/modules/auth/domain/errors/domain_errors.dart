import 'package:core_module/core.dart';

class InvalidNameError extends DomainError {
  InvalidNameError({required super.message});
}

class InvalidEmailError extends DomainError {
  InvalidEmailError({required super.message});
}

class InvalidPasswordError extends DomainError {
  InvalidPasswordError({required super.message});
}
