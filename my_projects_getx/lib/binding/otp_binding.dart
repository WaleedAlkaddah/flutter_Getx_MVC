import 'package:get/get.dart';
import '../controller/verify_and_resend_controller.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyAndResendController>(() => VerifyAndResendController());
  }
}
