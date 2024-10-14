import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:get/get.dart';
import 'package:my_projects/controller/login_controller.dart';

class LoginWait extends StatefulWidget {
  final String assetsPath;
  final Widget pageTo;
  final Bindings? bindingPageTo;
  final Widget pageOut;
  final Bindings? bindingPageOut;
  final Future<bool> dataProcess;

  const LoginWait({
    super.key,
    required this.assetsPath,
    required this.pageTo,
    required this.pageOut,
    required this.dataProcess,
    this.bindingPageTo,
    this.bindingPageOut,
  });

  @override
  State<LoginWait> createState() => _LoginWaitState();
}

class _LoginWaitState extends State<LoginWait> {
  final LoginController controller = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: FutureBuilder(
        future: widget.dataProcess,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    lottie.Lottie.asset(
                      widget.assetsPath,
                      width: 412.w,
                      height: 412.h,
                      fit: BoxFit.contain,
                      frameRate: const lottie.FrameRate(144),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.data == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.to(() => widget.pageTo, binding: widget.bindingPageTo);
            });
            return Container();
          } else if (snapshot.data == false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.to(() => widget.pageOut, binding: widget.bindingPageOut);
            });
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
