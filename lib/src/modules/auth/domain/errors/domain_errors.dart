import 'package:core_module/core.dart';

class InvalidEmailError extends DomainError {
  InvalidEmailError({required super.message});
}

class InvalidPasswordError extends DomainError {
  InvalidPasswordError({required super.message});
}
