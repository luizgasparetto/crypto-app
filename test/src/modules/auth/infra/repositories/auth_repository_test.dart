import 'package:core_module/core.dart';
import 'package:crypto_app/src/modules/auth/infra/datasources/i_auth_datasource.dart';
import 'package:crypto_app/src/modules/auth/infra/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/email.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/password.dart';

class AuthDatasourceMock extends Mock implements IAuthDatasource {}

void main() {
  final authDatasource = AuthDatasourceMock();
  final sut = AuthRepository(authDatasource);

  tearDownAll(() {
    reset(authDatasource);
  });

  group('Login With Email | ', () {
    final loginWithEmailDto = LoginWithEmailDTO(email: Email('email@email.com'), password: Password('123456'));

    setUp(() {
      registerFallbackValue(loginWithEmailDto);
    });

    group('Success | ', () {
      test('should be able to login with email successfully', () async {
        when(() => authDatasource.loginWithEmail(any())).thenAnswer((_) async {});

        final response = await sut.loginWithEmail(loginWithEmailDto);

        verify(() => authDatasource.loginWithEmail(any())).called(1);
        expect(response.fold((l) => l, (r) => r), equals(true));
      });
    });

    group('Fail | ', () {
      test('should not be able to login with email when datasource fails', () async {
        when(() => authDatasource.loginWithEmail(any())).thenThrow(DatasourceError(message: 'Error'));

        final response = await sut.loginWithEmail(loginWithEmailDto);

        verify(() => authDatasource.loginWithEmail(any())).called(1);
        expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
      });
    });
  });
}
