import 'package:core_module/core.dart';

import 'specifications/password_specifications.dart';

class Password extends IValueObject {
  Password(super.value) {
    super.setSpecification(PasswordSpecifications());
  }
}
