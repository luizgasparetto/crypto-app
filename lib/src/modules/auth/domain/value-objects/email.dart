import 'package:core_module/core.dart';

class Email extends IValueObject {
  Email(super.value);

  @override
  bool isValid() {
    if (value.isEmpty) {
      super.errorMessage = 'E-mail cannot be empty';

      return false;
    }

    if (!value.contains('@')) {
      super.errorMessage = 'E-mail must contains a @';

      return false;
    }

    if (value.startsWith(' ') || value.endsWith(' ')) {
      super.errorMessage = 'Invalid e-mail';

      return false;
    }

    return true;
  }
}
