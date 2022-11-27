import 'package:core_module/core.dart';

class Password extends IValueObject {
  Password(super.value);

  @override
  bool isValid() {
    if (value.isEmpty) return false;

    if (value.length < 6) return false;

    return true;
  }
}
