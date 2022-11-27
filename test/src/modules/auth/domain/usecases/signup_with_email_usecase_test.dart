import 'package:crypto_app/src/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core_module/core.dart';

import 'package:crypto_app/src/modules/auth/domain/dtos/signup_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/usecases/signup_with_email_usecase.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/email.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/name.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/password.dart';
import 'package:crypto_app/src/modules/auth/domain/errors/domain_errors.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  final authRepository = AuthRepositoryMock();
  final sut = SignUpWithEmailUsecase(authRepository);

  tearDownAll(() {
    reset(authRepository);
  });

  group('Success | ', () {
    test('should be able to sign up with email successfully', () async {
      final signUpSuccessParams = SignUpWithEmailDTO(
        name: Name('User Name'),
        email: Email('email@email.com'),
        password: Password('123456'),
      );

      when(() => authRepository.signUpWithEmail(signUpSuccessParams)).thenAnswer((_) async => right(true));

      final response = await sut.execute(signUpSuccessParams);

      verify(() => authRepository.signUpWithEmail(signUpSuccessParams)).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });
  });

  group('Fail | ', () {
    test('should not be able to sign up with a invalid name', () async {
      final nameFailParams = SignUpWithEmailDTO(
        name: Name('error'),
        email: Email('email@email.com'),
        password: Password('123456'),
      );

      final response = await sut.execute(nameFailParams);

      verifyNever(() => authRepository.signUpWithEmail(nameFailParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidNameError>());
    });

    test('should not be able to sign up with a invalid e-mail', () async {
      final emailFailParams = SignUpWithEmailDTO(
        name: Name('User Name'),
        email: Email('error'),
        password: Password('123456'),
      );

      final response = await sut.execute(emailFailParams);

      verifyNever(() => authRepository.signUpWithEmail(emailFailParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidEmailError>());
    });

    test('should not be able to sign up with a invalid password', () async {
      final passwordFailParams = SignUpWithEmailDTO(
        name: Name('User Name'),
        email: Email('email@email.com'),
        password: Password('error'),
      );

      final response = await sut.execute(passwordFailParams);

      verifyNever(() => authRepository.signUpWithEmail(passwordFailParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidPasswordError>());
    });

    test('should not be able to sign up with repository fails', () async {
      final signUpSuccessParams = SignUpWithEmailDTO(
        name: Name('User Name'),
        email: Email('email@email.com'),
        password: Password('123456'),
      );

      when(() => authRepository.signUpWithEmail(signUpSuccessParams)).thenAnswer(
        (_) async => left(DatasourceError(message: 'Error')),
      );

      final response = await sut.execute(signUpSuccessParams);

      verify(() => authRepository.signUpWithEmail(signUpSuccessParams)).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });
}
