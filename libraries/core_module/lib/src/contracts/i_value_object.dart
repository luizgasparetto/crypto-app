abstract class IValueObject {
  final String value;
  late String errorMessage;

  IValueObject(this.value);

  bool isValid();

  String? hasError() => isValid() ? null : errorMessage;
}
