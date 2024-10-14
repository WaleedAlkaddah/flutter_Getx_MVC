import 'package:get/get.dart';
import '../view/loading_view.dart';

class RouteGenerator {
  static List<GetPage> generatePages() {
    List<GetPage> pages = [GetPage(name: "/", page: () => const LoadingView())];
    pages.addAll([
      /*
      GetPage(
        name: Routes.otpView,
        page: () => const OTPView(),
        binding: OTPBinding(),
      ),
      GetPage(
        name: Routes.loginView,
        page: () => const LoginView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: Routes.homeView,
        page: () => const HomeView(),
      ),
      */
    ]);
    return pages;
  }
}
