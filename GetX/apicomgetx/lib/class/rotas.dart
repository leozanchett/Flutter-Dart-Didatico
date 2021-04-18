import 'package:apicomgetx/view/home.dart';
import 'package:apicomgetx/view/login.dart';
import 'package:get/get.dart';

class Router {
  static final route = [
    GetPage(
      name: '/loginView',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/homeView',
      page: () => HomeView(),
    ),
  ];
}
