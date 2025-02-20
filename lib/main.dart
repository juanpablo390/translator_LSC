import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/sections/login_page.dart';

void main() {
  runApp(const TraductorComSenhasApp());
}

class TraductorComSenhasApp extends StatelessWidget {
  const TraductorComSenhasApp({super.key});

  @override

  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      //designSize: const Size(412, 915), 
      designSize: MediaQuery.of(context).size,// Tamaño base del diseño
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Akshar'),
          home: LoginPage(),
        );
      },
    );
  }
}
