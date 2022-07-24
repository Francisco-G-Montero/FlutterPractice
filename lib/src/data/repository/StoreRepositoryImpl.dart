import 'package:whatibeendoing/src/core/resources/DataResult.dart';
import 'package:whatibeendoing/src/domain/repository/StoreRepository.dart';

import '../datasource/local/StoreService.dart';

class StoreRepositoryImpl implements StoreRepository{
  final StoreService _storeService;

  StoreRepositoryImpl(this._storeService);

  @override
  Future<DataResult2<String>> getText() {
    return _storeService.getText();
  }

  @override
  Future<DataResult2<String>> setText(String text) {
    return _storeService.setText(text);
  }

  @override
  Future<DataResult2<String>> getLoginDate() {
    return _storeService.getLoginDate();
  }

  @override
  Future<DataResult2<String>> storeLoginDate(String date) {
    return _storeService.storeLoginDate(date);
  }
}