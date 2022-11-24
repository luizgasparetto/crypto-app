import 'package:core_module/core.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../datasources/i_login_datasource.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource _loginDatasource;

  const LoginRepository(this._loginDatasource);

  @override
  Future<Either<IError, bool>> loginWithEmail(LoginWithEmailDTO dto) async {
    try {
      await _loginDatasource.loginWithEmail(dto);

      return right(true);
    } on IError catch (error, stackTrace) {
      return left(DatasourceError(message: 'Failed Login With Email', stackTrace: stackTrace, error: error.toString()));
    }
  }
}
