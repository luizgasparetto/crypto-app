import 'package:core_module/core.dart';

class EmailSpecifications extends ISpecification {
  @override
  bool isSatisfiedBy(String? value) {
    if (value == null || value.isEmpty) {
      message = 'E-mail cannot be empty';

      return false;
    }

    if (!value.contains('@')) {
      message = 'E-mail must contains a @';

      return false;
    }

    if (value.startsWith(' ') || value.endsWith(' ')) {
      message = 'Invalid e-mail';

      return false;
    }

    return true;
  }
}
