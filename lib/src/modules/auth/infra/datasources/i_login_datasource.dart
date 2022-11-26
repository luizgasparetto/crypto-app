import 'package:crypto_app/src/modules/auth/domain/dtos/login_with_email_dto.dart';

abstract class ILoginDatasource {
  Future<void> loginWithEmail(LoginWithEmailDTO dto);
}
