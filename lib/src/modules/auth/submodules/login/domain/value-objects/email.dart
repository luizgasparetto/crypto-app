import 'package:core_module/core.dart';

import 'specifications/email_specifications.dart';

class Email extends IValueObject {
  Email(super.value) {
    super.setSpecification(EmailSpecifications());
  }
}
