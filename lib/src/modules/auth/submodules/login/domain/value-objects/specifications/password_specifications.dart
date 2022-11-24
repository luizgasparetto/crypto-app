import 'package:core_module/core.dart';

class PasswordSpecifications extends ISpecification {
  @override
  bool isSatisfiedBy(String? value) {
    if (value == null || value.isEmpty) return false;

    if (value.length < 6) return false;

    return true;
  }
}
