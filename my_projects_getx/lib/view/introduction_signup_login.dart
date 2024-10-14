import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_projects/view/introduction_login.dart';
import '../assetsPath/assets_path.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';
import '../waleedWidget/background_image.dart';
import '../waleedWidget/elevated_button_widget.dart';
import 'package:quick_log/quick_log.dart';
import 'home.dart';

class IntroductionSignUpLogin extends StatefulWidget {
  const IntroductionSignUpLogin({super.key});

  @override
  State<IntroductionSignUpLogin> createState() =>
      _IntroductionSignUpLoginState();
}

class _IntroductionSignUpLoginState extends State<IntroductionSignUpLogin> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  final log = const Logger('IntroductionSignUpLogin');

  @override
  void initState() {
    Future<String?> token =
        sharedPreferencesData.readShared("verifyAndLoginAccessToken");
    token.then((value) {
      value?.isNotEmpty == true ? Get.offAll(() => const HomeView()) : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundImageWidget(
        image: AssetsPath.backgroundLoading,
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                AssetsPath.qareebLogo,
                width: 199.91.w,
                height: 168.86.h,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50.0).w,
                child: Column(
                  children: [
                    ElevatedButtonWidget(
                      name: WordsPath.login,
                      elevatedWidth: 295.0,
                      elevatedHeight: 48.0,
                      fontSize: 12.0,
                      onPressedCall: () =>
                          Get.to(() => const IntroductionLogin()),
                    ),
                    5.0.verticalSpace,
                    ElevatedButtonWidget(
                      name: WordsPath.newSignUp,
                      elevatedWidth: 295.0,
                      elevatedHeight: 48.0,
                      fontSize: 12.0,
                      elevatedColor: const Color(0xFFF5F5F5),
                      textColor: const Color(0xFF8BB93E),
                      onPressedCall: () =>
                          Get.to(() => const IntroductionSignUpLogin()),
                    ),
                  ],
                ),
              ),
              7.0.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
