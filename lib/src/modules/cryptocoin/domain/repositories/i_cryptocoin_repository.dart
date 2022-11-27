import 'package:core_module/core.dart';
import 'package:crypto_app/src/modules/cryptocoin/domain/entities/cryptocoin_entity.dart';

abstract class ICryptocoinRepository {
  Future<Either<IError, List<CryptocoinEntity>>> getAllCryptocoins();
}
