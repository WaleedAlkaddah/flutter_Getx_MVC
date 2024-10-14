import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_projects/model/login_model.dart';
import 'package:my_projects/view/login.dart';
import 'package:my_projects/view/otp_view.dart';
import '../assetsPath/assets_path.dart';
import '../binding/login_binding.dart';
import '../binding/otp_binding.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';
import '../view/login_wait.dart';
import '../waleedWidget/snack_bar_widget.dart';
import 'package:quick_log/quick_log.dart';

class LoginController extends GetxController {
  static final TextEditingController phoneNumberLoginController =
      TextEditingController();
  final TextEditingController oTPLoginController = TextEditingController();
  bool isChecked = false;
  String? phoneNumber = '';
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('LoginController');

  @override
  void onInit() {
    _initializeSharedPreferences();
    super.onInit();
  }

  void _initializeSharedPreferences() async {
    String? phone = await sharedPreferencesData.readShared('Phone');
    phoneNumberLoginController.text = phone ?? '';
    update();
  }

  Future<void> getSharedData() async {
    String? phone = await sharedPreferencesData.readShared("Phone");
    String? code = await sharedPreferencesData.readShared("Code");
    phoneNumber = phone ?? '';
    String? codeOTP = code ?? '';
    log.fine("getSharedData :  $phoneNumber : $codeOTP");
    if (codeOTP.isNotEmpty) {
      SnackBarWidget.showCustomSnackBar(
          " قم بإدخال الرقم التالي : $codeOTP", "التحقق");
    }
    update();
  }

  void checkLogin() {
    if (phoneNumberLoginController.text.isNotEmpty) {
      Get.to(
        () => LoginWait(
          assetsPath: AssetsPath.done,
          pageTo: const OTPView(),
          bindingPageTo: OTPBinding(),
          pageOut: const LoginView(),
          bindingPageOut: LoginBinding(),
          dataProcess: login(),
        ),
      );
    } else {
      SnackBarWidget.showCustomSnackBar(
          "قم بإدخال الرقم/ تأكد من ادخال الرقم بشكل صحيح", "فشل");
    }
  }

  void checkRemember(bool value) {
    isChecked = value;
    String? phone = LoginController.phoneNumberLoginController.text;
    if (isChecked == true) {
      sharedPreferencesData.writeShared(dataStore: phone, dataName: "Phone");
      log.fine(isChecked);
      update();
    } else {
      update();
      log.error(isChecked as String, includeStackTrace: false);
    }
  }

  Future<bool> login() async {
    final model = LoginModel(phoneNumber: "");
    String? phone = await sharedPreferencesData.readShared('Phone');
    if (phone == null) {
      log.error(
          "login Controller: Phone number not found in shared preferences",
          includeStackTrace: false);
      return false;
    }
    bool? data = await model.requestOTP(phone);
    String? code = await sharedPreferencesData.readShared('Code');
    if (data == true && code != null) {
      log.fine("login Controller : $data : Code : $code");
      return true;
    } else {
      log.error("login Controller data : $data , Code : $code",
          includeStackTrace: false);
      return false;
    }
  }
}
