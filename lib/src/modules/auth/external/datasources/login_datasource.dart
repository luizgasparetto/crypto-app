import '../../domain/dtos/login_with_email_dto.dart';
import '../../infra/datasources/i_login_datasource.dart';

class LoginDatasource implements ILoginDatasource {
  @override
  Future<void> loginWithEmail(LoginWithEmailDTO dto) async {
    throw UnimplementedError();
  }
}
