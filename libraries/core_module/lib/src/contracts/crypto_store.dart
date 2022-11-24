import 'package:core_module/core.dart';
import 'package:dependencies_module/dependencies_module.dart';

class CryptoStore<T extends Object> extends NotifierStore<IError, T> {
  CryptoStore({required T initialState}) : super(initialState);
}
