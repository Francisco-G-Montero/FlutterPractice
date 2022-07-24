import '../../../core/resources/DataResult.dart';
import '../../repository/StoreRepository.dart';

class GetStoredTextUseCase {
  final StoreRepository _storeRepository;

  GetStoredTextUseCase(this._storeRepository);

  Future<DataResult2<String>> getStoredText(){
    return _storeRepository.getText();
  }
}
