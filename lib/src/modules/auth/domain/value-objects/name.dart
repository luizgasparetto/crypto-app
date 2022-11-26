import 'package:core_module/core.dart';

import 'specifications/name_specifications.dart';

class Name extends IValueObject {
  Name(super.value) {
    super.setSpecification(NameSpecifications());
  }
}
