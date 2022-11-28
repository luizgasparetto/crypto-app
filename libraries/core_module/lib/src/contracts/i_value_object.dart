abstract class IValueObject {
  final String value;
  String errorMessage = 'Default Error Message';

  IValueObject(this.value);

  bool isValid();

  String? hasError() => isValid() ? null : errorMessage;
}
