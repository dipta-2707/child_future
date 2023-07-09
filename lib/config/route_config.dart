import 'package:child_future/views/sign_in_page.dart';
import 'package:get/get.dart';

class AppRouteConfig{
  static const String signInRoute = '/signInPageRoutePath';
  static final getPages= [
    GetPage(name: signInRoute, page: ()=> const SignInPage()),
  ];
}