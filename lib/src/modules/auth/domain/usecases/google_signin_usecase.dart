import 'package:core_module/core.dart';

import '../repositories/i_auth_repository.dart';

abstract class IGoogleSignInUsecase {
  Future<Either<IError, bool>> execute();
}

class GoogleSignInUsecase implements IGoogleSignInUsecase {
  final IAuthRepository _authRepository;

  const GoogleSignInUsecase(this._authRepository);

  @override
  Future<Either<IError, bool>> execute() async {
    return _authRepository.googleSignIn();
  }
}
