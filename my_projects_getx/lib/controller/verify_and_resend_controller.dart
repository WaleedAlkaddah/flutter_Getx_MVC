import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_projects/binding/otp_binding.dart';
import 'package:my_projects/view/home.dart';
import 'package:my_projects/view/otp_view.dart';
import '../assetsPath/assets_path.dart';
import '../model/verify_and_resnd_model.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';
import '../view/login_wait.dart';
import '../waleedWidget/snack_bar_widget.dart';
import 'login_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quick_log/quick_log.dart';

class VerifyAndResendController extends GetxController {
  final LoginController controller = Get.find<LoginController>();
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('');

  Future<bool> verify() async {
        String? codeOTP = await sharedPreferencesData.readShared("Code");
    log.info("Verify Start");
    final model = VerifyAndResendModel(phoneNumber: "", code: "");
    String? phone = await sharedPreferencesData.readShared("Phone");
    final verify = await model.verifyAndLogin(phoneNumber: phone!, code: codeOTP!);
    if (verify) {
      log.fine("Verify True");
      return true;
    }
    log.error("Verify False", includeStackTrace: false);
    return false;
  }

  void checkVerify() async {
    Get.to(
      () => LoginWait(
        assetsPath: AssetsPath.checkVerde,
        pageTo: const HomeView(),
        pageOut: const OTPView(),
        bindingPageOut: OTPBinding(),
        dataProcess: verify(),
      ),
    );
  }

  void resendOTP() async {
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.fadingCircle;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.textStyle = GoogleFonts.cairo(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );
    EasyLoading.instance.textColor = const Color(0xFF848484);
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.indicatorColor = const Color(0xFF4CA243);
    EasyLoading.instance.backgroundColor = Colors.white;
    EasyLoading.show(
      status: '.. تحميل',
    );
    controller.oTPLoginController.text = "";
    final test = await controller.login();
    if (test) {
      controller.getSharedData();
      EasyLoading.dismiss();
    } else {
      SnackBarWidget.showCustomSnackBar("هذا الرقم غير موجود", "التحقق");
      EasyLoading.dismiss();
    }
  }
}
