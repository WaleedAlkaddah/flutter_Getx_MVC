import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_projects/assetsPath/assets_path.dart';
import 'package:my_projects/controller/login_controller.dart';
import 'package:my_projects/waleedWidget/elevated_button_widget.dart';
import 'package:my_projects/waleedWidget/text_filed_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    loginController.isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            AssetsPath.qareebAppBar,
            width: 139.32.r,
            height: 30.78.r,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 54.0, top: 22.0).h,
                      child: Text(
                        WordsPath.login,
                        style: GoogleFonts.cairo(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4CA243),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18.5).w,
                      child: const TextFiledWidget(
                        widthFiled: 313.0,
                        heightFiled: 42.0,
                        labelFiled: WordsPath.enterPhoneNumber,
                        countryCode: "SY",
                        sizeFontLabel: 12.0,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                              bottom: 15.0, right: 20.5, top: 39.0)
                          .h
                          .w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 7.0).w,
                              child: FittedBox(
                                child: Text(
                                  WordsPath.rememberMe,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.bold,
                                    color: controller.isChecked
                                        ? const Color(0xFF4CA243)
                                        : const Color(0xFF838383),
                                  ),
                                ),
                              )),
                          Container(
                            width: 26.0.w,
                            height: 14.0.h,
                            margin: const EdgeInsets.only(right: 10.0).w,
                            child: Transform.scale(
                              scale: 0.6,
                              child: CupertinoSwitch(
                                activeColor: const Color(0xFF4CA243),
                                trackColor: const Color(0xFF838383),
                                value: controller.isChecked,
                                onChanged: (value) {
                                  controller.checkRemember(value);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 18.5)
                          .h
                          .w,
                      child: ElevatedButtonWidget(
                          name: WordsPath.login,
                          elevatedWidth: 313.0,
                          elevatedHeight: 48.0,
                          fontSize: 12.0,
                          onPressedCall: () {
                            controller.checkLogin();
                          }),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0).h,
                height: 16.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.off(const LoginView()),
                      child: Text(
                        WordsPath.createAccountNow,
                        style: GoogleFonts.cairo(
                          decoration: TextDecoration.underline,
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF8F8F8F),
                        ),
                      ),
                    ),
                    Text(
                      WordsPath.noAccount,
                      style: GoogleFonts.cairo(
                        fontSize: 12.0.sp,
                        color: const Color(0xFF9C9C9C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
