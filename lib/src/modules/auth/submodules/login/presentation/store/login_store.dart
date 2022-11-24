import 'package:core_module/core.dart';

import '../../domain/dtos/login_with_email_dto.dart';
import '../../domain/usecases/login_with_email_usecase.dart';

class LoginStore extends CryptoStore<bool> {
  final ILoginWithEmailUsecase _loginWithEmailUsecase;

  LoginStore(this._loginWithEmailUsecase) : super(initialState: false);

  Future<void> loginWithEmail(LoginWithEmailDTO dto) async {
    setLoading(true);

    final response = await _loginWithEmailUsecase.execute(dto);

    response.fold((l) => setError(l), (r) => update(true, force: true));
  }
}
