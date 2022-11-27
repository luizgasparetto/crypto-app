import 'package:core_module/core.dart';

import '../../domain/dtos/signup_with_email_dto.dart';
import '../../domain/repositories/i_signup_repository.dart';
import '../datasources/i_signup_datasource.dart';

class SignUpRepository implements ISignUpRepository {
  final ISignUpDatasource _signUpDatasource;

  const SignUpRepository(this._signUpDatasource);

  @override
  Future<Either<IError, bool>> signUpWithEmail(SignUpWithEmailDTO dto) async {
    try {
      await _signUpDatasource.signUpWithEmail(dto);

      return right(true);
    } on IError catch (error) {
      return left(error);
    }
  }
}
