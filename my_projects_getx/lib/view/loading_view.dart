import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../assetsPath/assets_path.dart';
import '../controller/check_inroductions.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';
import '../waleedWidget/background_image.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'introduction_view1.dart';
import 'package:flutter/services.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  CheckIntroductions checkIntroductions = CheckIntroductions();
  @override
  void initState() {
    checkIntroductions.checkPages(
        key: "splashShown", nextPage: const IntroductionView1());
    checkIntroductions.firstPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BackgroundImageWidget(
          image: AssetsPath.backgroundLoading,
          child: Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                SvgPicture.asset(
                  AssetsPath.qareebLogo,
                  width: 297.83.r,
                  height: 251.56.r,
                ),
                const Spacer(),
                lottie.Lottie.asset(
                  AssetsPath.loadingAnimation,
                  width: 298.r,
                  height: 168.r,
                ),
              ],
            ),
          ),
        ));
  }
}
