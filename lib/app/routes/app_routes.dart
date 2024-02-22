part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOMEPAGE = _Paths.HOMEPAGE;
}

abstract class _Paths {
  static const LOGIN = '/login-page';
  static const HOMEPAGE = '/home-page';
}