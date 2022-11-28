import 'package:core_module/core.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:crypto_app/src/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:crypto_app/src/modules/auth/domain/usecases/google_signin_usecase.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  final authRepository = AuthRepositoryMock();
  final sut = GoogleSignInUsecase(authRepository);

  tearDownAll(() {
    reset(authRepository);
  });

  group('Success | ', () {
    test('should be able to sign in with google successfully', () async {
      when(() => authRepository.googleSignIn()).thenAnswer((_) async => right(true));

      final response = await sut.execute();

      verify(() => authRepository.googleSignIn()).called(1);
      expect(response.fold((l) => l, (r) => r), equals(true));
    });
  });

  group('Fail | ', () {
    test('should not be able to sign in with google when repository fails', () async {
      when(() => authRepository.googleSignIn()).thenAnswer((_) async => left(DatasourceError(message: 'Error')));

      final response = await sut.execute();

      verify(() => authRepository.googleSignIn()).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });
}
