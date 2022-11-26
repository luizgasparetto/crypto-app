import 'package:core_module/core.dart';

class NameSpecifications extends ISpecification {
  @override
  bool isSatisfiedBy(String? value) {
    if (value == null || value.isEmpty) {
      message = 'Name cannot be empty';

      return false;
    }

    if (value.split(' ').length < 2) {
      message = 'Please, enter your full name';

      return false;
    }

    return true;
  }
}
