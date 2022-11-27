import 'package:core_module/core.dart';

class Name extends IValueObject {
  Name(super.value);

  @override
  bool isValid() {
    if (value.isEmpty) {
      super.errorMessage = 'Name cannot be empty';

      return false;
    }

    if (value.split(' ').length < 2) {
      super.errorMessage = 'Please, enter your full name';

      return false;
    }

    return true;
  }
}
