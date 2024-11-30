import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/sections/home_page.dart';
import 'package:translate_lsc/sections/login_page.dart';

void main() {
  runApp(const TraductorComSenhasApp());
}

class TraductorComSenhasApp extends StatelessWidget {
  const TraductorComSenhasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Tamaño base del diseño
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
