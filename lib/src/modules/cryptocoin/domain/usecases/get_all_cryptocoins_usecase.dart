import 'package:core_module/core.dart';
import 'package:crypto_app/src/modules/cryptocoin/domain/entities/cryptocoin_entity.dart';
import 'package:crypto_app/src/modules/cryptocoin/domain/repositories/i_cryptocoin_repository.dart';

abstract class IGetAllCryptocoinsUsecase {
  Future<Either<IError, List<CryptocoinEntity>>> execute();
}

class GetAllCryptocoinsUsecaseImpl implements IGetAllCryptocoinsUsecase {
  final ICryptocoinRepository _cryptocoinRepository;

  const GetAllCryptocoinsUsecaseImpl(this._cryptocoinRepository);

  @override
  Future<Either<IError, List<CryptocoinEntity>>> execute() async {
    return _cryptocoinRepository.getAllCryptocoins();
  }
}
