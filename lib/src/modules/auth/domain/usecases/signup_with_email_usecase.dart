import 'package:core_module/core.dart';

import '../dtos/signup_with_email_dto.dart';
import '../errors/domain_errors.dart';
import '../repositories/i_signup_repository.dart';

abstract class ISignUpWithEmailUsecase {
  Future<Either<IError, bool>> execute(SignUpWithEmailDTO dto);
}

class SignUpWithEmailUsecase implements ISignUpWithEmailUsecase {
  final ISignUpRepository _signUpRepository;

  const SignUpWithEmailUsecase(this._signUpRepository);

  @override
  Future<Either<IError, bool>> execute(SignUpWithEmailDTO dto) async {
    if (!dto.name.isValid()) {
      return left(InvalidNameError(message: dto.name.errorMessage));
    }

    if (!dto.email.isValid()) {
      return left(InvalidEmailError(message: dto.email.errorMessage));
    }

    if (!dto.password.isValid()) {
      return left(InvalidPasswordError(message: dto.password.errorMessage));
    }

    return _signUpRepository.signUpWithEmail(dto);
  }
}
