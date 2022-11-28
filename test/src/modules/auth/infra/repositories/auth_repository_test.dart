import 'package:core_module/core.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:crypto_app/src/modules/auth/infra/datasources/i_auth_datasource.dart';
import 'package:crypto_app/src/modules/auth/infra/repositories/auth_repository.dart';
import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/email.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/password.dart';
import 'package:crypto_app/src/modules/auth/domain/dtos/signup_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/domain/value-objects/name.dart';

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

    test('should be able to login with email successfully', () async {
      when(() => authDatasource.loginWithEmail(any())).thenAnswer((_) async {});

      final response = await sut.loginWithEmail(loginWithEmailDto);

      verify(() => authDatasource.loginWithEmail(any())).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });

    test('should not be able to login with email when datasource fails', () async {
      when(() => authDatasource.loginWithEmail(any())).thenThrow(DatasourceError(message: 'Error'));

      final response = await sut.loginWithEmail(loginWithEmailDto);

      verify(() => authDatasource.loginWithEmail(any())).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });

  group('SignUp With Email | ', () {
    final signUpDto = SignUpWithEmailDTO(
      name: Name('name'),
      email: Email('email@email.com'),
      password: Password('123456'),
    );

    setUp(() {
      registerFallbackValue(signUpDto);
    });

    test('should be able to sign up with email successfully', () async {
      when(() => authDatasource.signUpWithEmail(any())).thenAnswer((_) async {});

      final response = await sut.signUpWithEmail(signUpDto);

      verify(() => authDatasource.signUpWithEmail(any())).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });

    test('should not be able to sign up with email when datasource fails', () async {
      when(() => authDatasource.signUpWithEmail(any())).thenThrow(DatasourceError(message: 'Error'));

      final response = await sut.signUpWithEmail(signUpDto);

      verify(() => authDatasource.signUpWithEmail(any())).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });

  group('Google Sign In | ', () {
    test('should be able to sign in with google successfully', () async {
      when(() => authDatasource.googleSignIn()).thenAnswer((_) async {});

      final response = await sut.googleSignIn();

      verify(() => authDatasource.googleSignIn()).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });

    test('should not be able to sign in with google when datasource fails', () async {
      when(() => authDatasource.googleSignIn()).thenThrow(DatasourceError(message: 'Error'));

      final response = await sut.googleSignIn();

      verify(() => authDatasource.googleSignIn()).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });
}
