import '../../../core/resources/DataResult.dart';
import '../../repository/StoreRepository.dart';

class StoreLoginDateUseCase {
  final StoreRepository _storeRepository;

  StoreLoginDateUseCase(this._storeRepository);

  Future<DataResult2<String>> storeLoginDate(String date){
    return _storeRepository.storeLoginDate(date);
  }
}