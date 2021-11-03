import 'package:altshue/app/modules/about/bindings/about_binding.dart';
import 'package:altshue/app/modules/about/views/about_view.dart';
import 'package:altshue/app/modules/account/bindings/account_binding.dart';
import 'package:altshue/app/modules/account/views/account_view.dart';
import 'package:altshue/app/modules/bank_account/bindings/bank_account_binding.dart';
import 'package:altshue/app/modules/bank_account/views/bank_account_view.dart';
import 'package:altshue/app/modules/bug_error/bindings/bug_error_binding.dart';
import 'package:altshue/app/modules/bug_error/views/bug_error_view.dart';
import 'package:altshue/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:altshue/app/modules/change_password/views/change_password_view.dart';
import 'package:altshue/app/modules/contact/bindings/contact_binding.dart';
import 'package:altshue/app/modules/contact/views/contact_view.dart';
import 'package:altshue/app/modules/language/bindings/language_binding.dart';
import 'package:altshue/app/modules/language/views/language_view.dart';
import 'package:altshue/app/modules/settings/bindings/settings_binding.dart';
import 'package:altshue/app/modules/settings/views/settings_view.dart';
import 'package:get/get.dart';

import 'package:altshue/app/modules/friends/bindings/friends_binding.dart';
import 'package:altshue/app/modules/friends/views/friends_view.dart';
import 'package:altshue/app/modules/friends_add/bindings/friends_add_binding.dart';
import 'package:altshue/app/modules/friends_add/views/friends_add_view.dart';
import 'package:altshue/app/modules/home/bindings/home_binding.dart';
import 'package:altshue/app/modules/home/views/home_view.dart';
import 'package:altshue/app/modules/ktp_verif/bindings/ktp_verif_binding.dart';
import 'package:altshue/app/modules/ktp_verif/views/ktp_verif_view.dart';
import 'package:altshue/app/modules/login/bindings/login_binding.dart';
import 'package:altshue/app/modules/login/views/login_view.dart';
import 'package:altshue/app/modules/news/bindings/news_binding.dart';
import 'package:altshue/app/modules/news/views/news_view.dart';
import 'package:altshue/app/modules/news_detail/bindings/news_detail_binding.dart';
import 'package:altshue/app/modules/news_detail/views/news_detail_view.dart';
import 'package:altshue/app/modules/register/bindings/register_binding.dart';
import 'package:altshue/app/modules/register/views/register_view.dart';
import 'package:altshue/app/modules/splash/bindings/splash_binding.dart';
import 'package:altshue/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ACCOUNT;

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
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => NewsDetailView(),
      binding: NewsDetailBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDS,
      page: () => FriendsView(),
      binding: FriendsBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDS_ADD,
      page: () => FriendsAddView(),
      binding: FriendsAddBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.BANK_ACCOUNT,
      page: () => BankAccountView(),
      binding: BankAccountBinding(),
    ),
    GetPage(
      name: _Paths.BUG_ERROR,
      page: () => BugErrorView(),
      binding: BugErrorBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
