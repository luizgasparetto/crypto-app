import 'package:core_module/core.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../domain/dtos/signup_with_email_dto.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/i_auth_datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource _authDatasource;

  const AuthRepository(this._authDatasource);

  @override
  Future<Either<IError, bool>> loginWithEmail(LoginWithEmailDTO dto) async {
    try {
      await _authDatasource.loginWithEmail(dto);

      return right(true);
    } on IError catch (error) {
      return left(error);
    }
  }

  @override
  Future<Either<IError, bool>> signUpWithEmail(SignUpWithEmailDTO dto) async {
    try {
      await _authDatasource.signUpWithEmail(dto);

      return right(true);
    } on IError catch (error) {
      return left(error);
    }
  }

  @override
  Future<Either<IError, bool>> googleSignIn() async {
    try {
      await _authDatasource.googleSignIn();

      return right(true);
    } on IError catch (error) {
      return left(error);
    }
  }
}
