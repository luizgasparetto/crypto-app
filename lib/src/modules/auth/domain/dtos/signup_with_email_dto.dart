import '../value-objects/email.dart';
import '../value-objects/name.dart';
import '../value-objects/password.dart';

class SignUpWithEmailDTO {
  final Name name;
  final Email email;
  final Password password;

  const SignUpWithEmailDTO({
    required this.name,
    required this.email,
    required this.password,
  });
}
