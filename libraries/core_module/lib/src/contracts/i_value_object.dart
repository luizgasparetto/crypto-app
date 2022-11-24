import 'package:core_module/src/contracts/i_specification.dart';

abstract class IValueObject {
  final String value;
  late ISpecification _specification;

  IValueObject(this.value);

  void setSpecification(ISpecification specification) => _specification = specification;

  bool get isValid => _specification.isSatisfiedBy(value);

  String get errorMessage => _specification.message;

  String? hasError() => isValid ? null : errorMessage;
}
