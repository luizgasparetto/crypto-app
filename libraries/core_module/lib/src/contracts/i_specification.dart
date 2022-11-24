abstract class ISpecification {
  String message = 'Default Error';

  bool isSatisfiedBy(String? value);
}
