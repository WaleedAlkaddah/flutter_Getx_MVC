import 'dart:async';
import 'package:get/get.dart';
import '../sharedPreferencesData/shared_preferences_data.dart';
import 'package:flutter/material.dart';
import 'package:quick_log/quick_log.dart';
import '../view/introduction_view1.dart';

class CheckIntroductions {
  SharedPreferencesData sharedPreferencesData = SharedPreferencesData();
  late Future<bool> screenShown;
  final log = const Logger('CheckIntroductions');

  void checkPages({
    required String key,
    required Widget nextPage,
  }) async {
    log.info("Start $key", includeStackTrace: false);
    screenShown = sharedPreferencesData.checkIfIntroductionShown(key);
    if (await screenShown) {
      Get.offAll(() => nextPage);
    }
    log.info("End $key", includeStackTrace: false);
  }

  void firstPage() async {
    // تم وضع شرط لانه يقوم باعادة الريفيرش بعد انتهاء ال 4 ثواني
    if (await screenShown == true) {
      Get.offAll(() => const IntroductionView1());
    } else {
      Timer(const Duration(seconds: 4), () {
        sharedPreferencesData.markIntroductionAsShown('splashShown');
        Get.offAll(() => const IntroductionView1());
      });
    }
  }
}
