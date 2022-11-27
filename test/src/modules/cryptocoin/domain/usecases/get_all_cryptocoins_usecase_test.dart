import 'package:core_module/core.dart';
import 'package:crypto_app/src/modules/cryptocoin/domain/entities/cryptocoin_entity.dart';
import 'package:crypto_app/src/modules/cryptocoin/domain/repositories/i_cryptocoin_repository.dart';
import 'package:crypto_app/src/modules/cryptocoin/domain/usecases/get_all_cryptocoins_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptocoinRepositoryMock extends Mock implements ICryptocoinRepository {}

void main() {
  late final ICryptocoinRepository repository;
  late final IGetAllCryptocoinsUsecase sut;

  setUpAll(() {
    repository = CryptocoinRepositoryMock();
    sut = GetAllCryptocoinsUsecaseImpl(repository);
  });

  group('Get All Cryptocoins Usecase | ', () {
    test('should be able to call repository and return a list of cryptocoins', () async {
      when(() => repository.getAllCryptocoins()).thenAnswer((_) async => right([]));

      final response = await sut.execute();

      verify(() => repository.getAllCryptocoins()).called(1);
      expect(response.fold((l) => l, (r) => r), isA<List<CryptocoinEntity>>());
    });

    test('should return a DatasourceError when repository fails', () async {
      when(() => repository.getAllCryptocoins()).thenAnswer(
        (_) async => left(DatasourceError(message: 'Error', stackTrace: StackTrace.empty)),
      );

      final response = await sut.execute();

      verify(() => repository.getAllCryptocoins()).called(1);
      expect(response.fold((l) => l, (r) => r), isA<DatasourceError>());
    });
  });
}
