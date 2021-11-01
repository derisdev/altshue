import 'package:get/get.dart';

import 'package:altshue/app/modules/home/bindings/home_binding.dart';
import 'package:altshue/app/modules/home/views/home_view.dart';
import 'package:altshue/app/modules/ktp_verif/bindings/ktp_verif_binding.dart';
import 'package:altshue/app/modules/ktp_verif/views/ktp_verif_view.dart';
import 'package:altshue/app/modules/login/bindings/login_binding.dart';
import 'package:altshue/app/modules/login/views/login_view.dart';
import 'package:altshue/app/modules/register/bindings/register_binding.dart';
import 'package:altshue/app/modules/register/views/register_view.dart';
import 'package:altshue/app/modules/splash/bindings/splash_binding.dart';
import 'package:altshue/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.KTP_VERIF,
      page: () => KtpVerifView(),
      binding: KtpVerifBinding(),
    ),
  ];
}
