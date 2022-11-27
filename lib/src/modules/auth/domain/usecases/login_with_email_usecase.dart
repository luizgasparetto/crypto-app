import 'package:core_module/core.dart';

import '../dtos/login_with_email_dto.dart';
import '../errors/domain_errors.dart';
import '../repositories/i_auth_repository.dart';

abstract class ILoginWithEmailUsecase {
  Future<Either<IError, bool>> execute(LoginWithEmailDTO dto);
}

class LoginWithEmailUsecase implements ILoginWithEmailUsecase {
  final IAuthRepository _authRepository;

  const LoginWithEmailUsecase(this._authRepository);

  @override
  Future<Either<IError, bool>> execute(LoginWithEmailDTO dto) async {
    if (!dto.email.isValid()) {
      return left(InvalidEmailError(message: dto.email.errorMessage));
    }

    if (!dto.password.isValid()) {
      return left(InvalidPasswordError(message: dto.password.errorMessage));
    }

    return _authRepository.loginWithEmail(dto);
  }
}
