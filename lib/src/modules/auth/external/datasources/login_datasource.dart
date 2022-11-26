import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';
import 'package:crypto_app/src/modules/auth/infra/datasources/i_login_datasource.dart';

class LoginDatasource implements ILoginDatasource {
  @override
  Future<void> loginWithEmail(LoginWithEmailDTO dto) async {
    throw UnimplementedError();
  }
}
