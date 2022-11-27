import 'package:crypto_app/src/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core_module/core.dart';

import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/errors/domain_errors.dart';
import 'package:crypto_app/src/modules/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/email.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/password.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  final authRepository = AuthRepositoryMock();
  final sut = LoginWithEmailUsecase(authRepository);

  tearDownAll(() {
    reset(authRepository);
  });

  group('Success | ', () {
    test('should be able to login with e-mail successfully', () async {
      final successParams = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('123456'));

      when(() => authRepository.loginWithEmail(successParams)).thenAnswer((_) async => right(true));

      final response = await sut.execute(successParams);

      verify(() => authRepository.loginWithEmail(successParams)).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });
  });

  group('Fail | ', () {
    test('should not be able to login with a invalid e-mail', () async {
      final invalidEmailParams = LoginWithEmailDTO(email: Email('error'), password: Password('123456'));

      final response = await sut.execute(invalidEmailParams);

      verifyNever(() => authRepository.loginWithEmail(invalidEmailParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidEmailError>());
    });

    test('should not be able to login with a invalid password', () async {
      final invalidPasswordParams = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('error'));

      final response = await sut.execute(invalidPasswordParams);

      verifyNever(() => authRepository.loginWithEmail(invalidPasswordParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidPasswordError>());
    });

    test('should not be able to login when repository method fails', () async {
      final successParams = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('123456'));

      when(() => authRepository.loginWithEmail(successParams)).thenAnswer(
        (_) async => left(DatasourceError(message: 'Error')),
      );

      final response = await sut.execute(successParams);

      verify(() => authRepository.loginWithEmail(successParams)).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });
}
