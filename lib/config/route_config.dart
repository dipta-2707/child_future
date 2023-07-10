import 'package:child_future/binding/home_page_binding.dart';
import 'package:child_future/binding/report_child_binding.dart';
import 'package:child_future/binding/sign_in_page_binding.dart';
import 'package:child_future/binding/sign_up_page_binding.dart';
import 'package:child_future/views/home_page.dart';
import 'package:child_future/views/report_child_page.dart';
import 'package:child_future/views/sign_in_page.dart';
import 'package:child_future/views/sign_up_page.dart';
import 'package:get/get.dart';

class AppRouteConfig{
  static const String signInRoute = '/signInPageRoutePath';
  static const String signUpRoute = '/signUpPageRoutePath';
  static const String homeRoute = '/homePageRoutePath';
  static const String reportChildRoute = '/reportChildRoutePage';
  static final getPages= [
    GetPage(name: signInRoute, page: ()=> const SignInPage(),
      binding: SignInPageBinding()
    ),

    GetPage(name: signUpRoute, page: ()=> const SignUpPage(),
        binding: SignUpPageBinding(),
      transition: Transition.cupertino
    ),

    GetPage(name: homeRoute, page: ()=> const HomePage(),
        binding:HomePageBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(name: reportChildRoute, page: ()=> const ReportChildPage(),
        binding:ReportChildBinding(),
        transition: Transition.fadeIn
    ),
  ];
}