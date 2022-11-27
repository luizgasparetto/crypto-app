import 'package:core_module/core.dart';

import '../../domain/dtos/signup_with_email_dto.dart';
import '../../domain/usecases/signup_with_email_usecase.dart';

class SignUpStore extends CryptoStore<bool> {
  final ISignUpWithEmailUsecase _signUpWithEmailUsecase;

  SignUpStore(this._signUpWithEmailUsecase) : super(initialState: false);

  Future<void> signUpWithEmail(SignUpWithEmailDTO dto) async {
    setLoading(true);

    final response = await _signUpWithEmailUsecase.execute(dto);

    response.fold((l) => setError(l), (r) => update(true, force: true));
  }
}
