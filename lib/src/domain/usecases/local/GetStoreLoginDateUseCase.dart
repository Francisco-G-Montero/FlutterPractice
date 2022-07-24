import '../../../core/resources/DataResult.dart';
import '../../repository/StoreRepository.dart';

class GetStoreLoginDateUseCase {
  final StoreRepository _storeRepository;

  GetStoreLoginDateUseCase(this._storeRepository);

  Future<DataResult2<String>> getLoginDate(){
    return _storeRepository.getLoginDate();
  }
}