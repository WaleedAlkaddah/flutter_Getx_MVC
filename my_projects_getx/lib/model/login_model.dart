import 'package:quick_log/quick_log.dart';
import '../assetsPath/assets_path.dart';
import '../services/api_services.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';

class LoginModel {
  final String phoneNumber;
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  LoginModel({required this.phoneNumber});
  final log = const Logger('LoginModel');
  Future<bool> requestOTP(String phoneNumber) async {
    try {
      final dataToSend = {
        'phoneNumber': phoneNumber,
      };
      final response =
          await ApiService().postApi(dataToSend, ApiPath.requestOTP);
      if (response['statusCode'] == 200) {
        log.fine("response model requestOTP : ${response["statusCode"]}");
        final resultOTP = response['data']["result"];
        await sharedPreferencesData.writeShared(
            dataStore: resultOTP, dataName: "Code");
        return true;
      } else {
        final resultOtpError = response["data"]["error"]["message"];
        await sharedPreferencesData.writeShared(
            dataStore: resultOtpError, dataName: "ErrorOnLogin");
        log.error(
            "Failed to request OTP. Status code: ${response['statusCode']}",
            includeStackTrace: false);
        return false;
      }
    } catch (e) {
      log.error("response model requestOTP : $e", includeStackTrace: false);
      return false;
    }
  }
}
