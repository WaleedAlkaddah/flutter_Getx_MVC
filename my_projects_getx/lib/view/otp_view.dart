import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_projects/controller/login_controller.dart';
import 'package:my_projects/controller/verify_and_resend_controller.dart';
import 'package:pinput/pinput.dart';
import '../assetsPath/assets_path.dart';
import '../waleedWidget/elevated_button_widget.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    loginController.oTPLoginController.text = "";
    loginController.showCode();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: SvgPicture.asset(
              AssetsPath.qareebAppBar,
              width: 139.32.w,
              height: 30.78.h,
            ),
          ),
          body: Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 31.0).w,
                  width: 1.0.sw,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(10.0).r,
                  ),
                  child: Column(
                    children: [
                      10.0.verticalSpace,
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          WordsPath.confirmTheNumber,
                          style: GoogleFonts.cairo(
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4CA243),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(right: 25.0, bottom: 9.0)
                                    .w,
                            child: Text(
                              WordsPath.sendConformation,
                              style: GoogleFonts.cairo(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF848484),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 17.0).w.h,
                            child: Text(
                              "+${controller.phoneNumber}",
                              style: GoogleFonts.cairo(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF848484),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 295.w,
                        height: 50.h,
                        margin: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 26.0)
                            .h
                            .w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFDFDFDFF),
                        ),
                        child: Pinput(
                          length: 6,
                          controller: controller.oTPLoginController,
                          submittedPinTheme: const PinTheme(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          defaultPinTheme: const PinTheme(),
                          keyboardType: TextInputType.number,
                          separator: Container(
                            width: 2,
                            height: 29,
                            color: const Color(0x0fd9d9d9),
                          ),
                          onCompleted: (pin) {},
                        ),
                      ),
                      GetBuilder<VerifyAndResendController>(
                          builder: (controller) {
                        return Container(
                          margin:
                              const EdgeInsets.symmetric(horizontal: 27.0).w,
                          child: ElevatedButtonWidget(
                            name: WordsPath.verify,
                            elevatedWidth: 296.0,
                            elevatedHeight: 48.0,
                            fontSize: 12.0,
                            onPressedCall: () {
                              controller.checkVerify();
                            },
                          ),
                        );
                      }),
                      GetBuilder<VerifyAndResendController>(
                          builder: (controller) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 14.0).h,
                          child: InkWell(
                            onTap: () {
                              controller.resendOTP();
                            },
                            child: Text(
                              WordsPath.resendOTP,
                              style: GoogleFonts.cairo(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF848484),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
