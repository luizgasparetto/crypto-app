import 'package:core_module/core.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../domain/dtos/signup_with_email_dto.dart';
import '../../infra/datasources/i_auth_datasource.dart';

class AuthDatasource implements IAuthDatasource {
  final IAuthService _authService;

  const AuthDatasource(this._authService);

  @override
  Future<void> loginWithEmail(LoginWithEmailDTO dto) async {
    final email = dto.email.value;
    final password = dto.password.value;

    return _authService.loginWithEmail(email: email, password: password);
  }

  @override
  Future<void> signUpWithEmail(SignUpWithEmailDTO dto) async {
    final email = dto.email.value;
    final password = dto.password.value;

    return _authService.signUpWithEmail(email: email, password: password);
  }

  @override
  Future<void> googleSignIn() async {
    return _authService.googleSignIn();
  }
}
