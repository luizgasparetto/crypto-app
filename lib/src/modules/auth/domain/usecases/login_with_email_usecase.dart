import 'package:core_module/core.dart';

import '../dtos/login_with_email_dto.dart';
import '../errors/domain_errors.dart';
import '../repositories/i_login_repository.dart';

abstract class ILoginWithEmailUsecase {
  Future<Either<IError, bool>> execute(LoginWithEmailDTO dto);
}

class LoginWithEmailUsecase implements ILoginWithEmailUsecase {
  final ILoginRepository _loginRepository;

  const LoginWithEmailUsecase(this._loginRepository);

  @override
  Future<Either<IError, bool>> execute(LoginWithEmailDTO dto) async {
    if (!dto.email.isValid) {
      return left(InvalidEmailError(message: dto.email.errorMessage));
    }

    if (!dto.password.isValid) {
      return left(InvalidPasswordError(message: dto.password.errorMessage));
    }

    return _loginRepository.loginWithEmail(dto);
  }
}
