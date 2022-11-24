import '../value-objects/email.dart';
import '../value-objects/password.dart';

class LoginWithEmailDTO {
  final Email email;
  final Password password;

  const LoginWithEmailDTO({
    required this.email,
    required this.password,
  });
}
