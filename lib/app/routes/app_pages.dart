import 'package:fintrch/app/modules/home-page/bindings/home_page_binding.dart';
import 'package:fintrch/app/modules/home-page/views/home_page_view.dart';
import 'package:fintrch/app/modules/login-page/bindings/login_page_binding.dart';
import 'package:fintrch/app/modules/login-page/views/login_page_view.dart';
import 'package:get/get.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),

    ),
  ];

}