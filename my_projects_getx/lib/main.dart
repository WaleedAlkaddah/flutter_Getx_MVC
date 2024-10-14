import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_projects/view/loading_view.dart';

// data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
// if i need to let font size fixed we can wrap the GetMaterialApp with
// Media Query and the data of it is
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412.0, 870.0),
        //MediaQuery.of(context).size,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: GetMaterialApp(
              initialRoute: '/',
              getPages: [GetPage(name: "/", page: () => const LoadingView())],
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
