import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core_module/core.dart';

import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/errors/domain_errors.dart';
import 'package:crypto_app/src/modules/auth/domain/repositories/i_login_repository.dart';
import 'package:crypto_app/src/modules/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/email.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/password.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

void main() {
  final loginRepository = LoginRepositoryMock();
  final sut = LoginWithEmailUsecase(loginRepository);

  tearDownAll(() {
    reset(loginRepository);
  });

  group('Success | ', () {
    test('should be able to login with e-mail successfully', () async {
      final successParams = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('123456'));

      when(() => loginRepository.loginWithEmail(successParams)).thenAnswer((_) async => right(true));

      final response = await sut.execute(successParams);

      verify(() => loginRepository.loginWithEmail(successParams)).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });
  });

  group('Fail | ', () {
    test('should not be able to login with a invalid e-mail', () async {
      final invalidEmailParams = LoginWithEmailDTO(email: Email('error'), password: Password('123456'));

      final response = await sut.execute(invalidEmailParams);

      verifyNever(() => loginRepository.loginWithEmail(invalidEmailParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidEmailError>());
    });

    test('should not be able to login with a invalid password', () async {
      final invalidPasswordParams = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('error'));

      final response = await sut.execute(invalidPasswordParams);

      verifyNever(() => loginRepository.loginWithEmail(invalidPasswordParams));
      expect(response.fold((l) => l, (r) => r), isA<InvalidPasswordError>());
    });

    test('should not be able to login when repository method fails', () async {
      final successParams = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('123456'));

      when(() => loginRepository.loginWithEmail(successParams)).thenAnswer(
        (_) async => left(DatasourceError(message: 'Error')),
      );

      final response = await sut.execute(successParams);

      verify(() => loginRepository.loginWithEmail(successParams)).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });
}
