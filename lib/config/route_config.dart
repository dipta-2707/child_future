import 'package:child_future/binding/home_page_binding.dart';
import 'package:child_future/binding/profile_binding.dart';
import 'package:child_future/binding/report_child_binding.dart';
import 'package:child_future/binding/sign_in_page_binding.dart';
import 'package:child_future/binding/sign_up_page_binding.dart';
import 'package:child_future/binding/splash_binding.dart';
import 'package:child_future/views/forget_pass_page.dart';
import 'package:child_future/views/home_page.dart';
import 'package:child_future/views/profile_page.dart';
import 'package:child_future/views/report_child_page.dart';
import 'package:child_future/views/sign_in_page.dart';
import 'package:child_future/views/sign_up_page.dart';
import 'package:child_future/views/splash_page.dart';
import 'package:get/get.dart';

class AppRouteConfig {
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signInPageRoutePath';
  static const String signUpRoute = '/signUpPageRoutePath';
  static const String homeRoute = '/homePageRoutePath';
  static const String reportChildRoute = '/reportChildRoutePage';
  static const String profiledRoute = '/profiledRoutePage';
  static const String forgetPassword = '/forgetPasswordPage';
  static final getPages = [
    GetPage(
        name: splashRoute,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: signInRoute,
        page: () => const SignInPage(),
        binding: SignInPageBinding()),
    GetPage(
        name: signUpRoute,
        page: () => const SignUpPage(),
        binding: SignUpPageBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: homeRoute,
        page: () => const HomePage(),
        binding: HomePageBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: reportChildRoute,
        page: () => const ReportChildPage(),
        binding: ReportChildBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: profiledRoute,
        page: () => const ProfilePage(),
        binding: ProfilePageBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: forgetPassword,
        page: () => const ForgetPassPage(),
        transition: Transition.fadeIn),
  ];
}
