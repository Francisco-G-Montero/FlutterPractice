import '../../core/resources/DataResult.dart';

abstract class StoreRepository {
  Future<DataResult2<String>> getText();
  Future<DataResult2<String>> setText(String text);
  Future<DataResult2<String>> storeLoginDate(String date);
  Future<DataResult2<String>> getLoginDate();
}