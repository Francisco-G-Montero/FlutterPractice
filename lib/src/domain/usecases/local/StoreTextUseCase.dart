import '../../../core/resources/DataResult.dart';
import '../../repository/StoreRepository.dart';

class StoreTextUseCase {
  final StoreRepository _storeRepository;

  StoreTextUseCase(this._storeRepository);

  Future<DataResult2<String>> storeText(String text){
    return _storeRepository.setText(text);
  }
}