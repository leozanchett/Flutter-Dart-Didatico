import 'package:apicomgetx/controller/login.dart';
import 'package:apicomgetx/modules/rotas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  runApp(
    GetMaterialApp(
      title: 'GetX APP',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: Routers.route,
      initialRoute: '/loginView',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
          textTheme: TextTheme(
            headline6: GoogleFonts.exo2(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
