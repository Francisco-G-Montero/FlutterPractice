import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatibeendoing/src/core/resources/DataResult.dart';

const String STORE_LOGIN_DATE = "store_login_date";
class StoreService {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> getPrefs() async {
    if(_sharedPreferences == null){
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences!;
  }

  Future<ResultSuccess<String>> getText() async {
    String text = "";
    await Future.delayed(Duration(milliseconds: 1000));
    await getPrefs().then((sharedPreferences) => {
      text = sharedPreferences.getString("key") ?? ''
    });
    return ResultSuccess(text);
  }

  Future<ResultSuccess<String>> setText(String text) async {
    await getPrefs().then((sharedPreferences) => {
      sharedPreferences.setString("key", text)
    });
    return const ResultSuccess("Text saved");
  }

  Future<ResultSuccess<String>> storeLoginDate(String date) async {
    await getPrefs().then((sharedPreferences) => {
      sharedPreferences.setString(STORE_LOGIN_DATE, date)
    });
    return const ResultSuccess("Date saved");
  }


  Future<ResultSuccess<String>> getLoginDate() async {
    String text = "";
    await getPrefs().then((sharedPreferences) => {
      text = sharedPreferences.getString(STORE_LOGIN_DATE) ?? ''
    });
    return ResultSuccess(text);
  }
}
