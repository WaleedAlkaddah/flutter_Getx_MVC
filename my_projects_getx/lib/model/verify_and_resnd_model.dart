import 'package:quick_log/quick_log.dart';
import '../assetsPath/assets_path.dart';
import '../services/api_services.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';

class VerifyAndResendModel {
  final String phoneNumber;
  final String code;

  VerifyAndResendModel({required this.code, required this.phoneNumber});
  final log = const Logger('VerifyAndResendModel');
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();

  Future<bool> verifyAndLogin(
      {required String phoneNumber, required String code}) async {
    try {
      final dataToSend = {'phoneNumber': phoneNumber, 'code': code};
      final response =
          await ApiService().postApi(dataToSend, ApiPath.verifyAndLogin);
      if (response['statusCode'] == 200) {
        final verifyAndLoginAccessToken =
            response["data"]["result"]["accessToken"];
        final verifyAndLoginExpireInSeconds =
            response["data"]["result"]["expireInSeconds"].toString();
        await sharedPreferencesData.writeShared(
            dataStore: verifyAndLoginAccessToken,
            dataName: "verifyAndLoginAccessToken");
        await sharedPreferencesData.writeShared(
            dataStore: verifyAndLoginExpireInSeconds,
            dataName: "verifyAndLoginExpireInSeconds");
        log.fine("response model verifyAndLogin : ${response["statusCode"]}");
        return true;
      } else {
        final verifyAndLoginError = response["data"]["error"]["message"];
        await sharedPreferencesData.writeShared(
            dataStore: verifyAndLoginError,
            dataName: "ErrorOnVerifyAndLoginError");
        log.error(
            "Failed to verifyAndLogin Status code: ${response['statusCode']}",
            includeStackTrace: false);
        return false;
      }
    } catch (err) {
      log.error("response model verifyAndLogin : $err",
          includeStackTrace: false);
      return false;
    }
  }
}
