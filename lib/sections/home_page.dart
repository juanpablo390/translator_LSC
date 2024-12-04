import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/componentes/links_drawer.dart';
import 'package:translate_lsc/sections/profile_page.dart';
import 'package:translate_lsc/sections/sign_translator_page.dart';
import 'package:translate_lsc/sections/text_translator_page.dart'; // Importa flutter_screenutil

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _islanguageExchange = false;

  void _languageExchange() {
    setState(() {
      _islanguageExchange = !_islanguageExchange;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: LinksDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Contenido principal
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu,
                              color: Colors.black, size: 30.sp),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                        Text(
                          "Shary Ortega",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    // Titulos
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/logo_2.png',
                          height: 145.h,
                          width: 145.w,
                        ),
                        Text(
                          'TRADUCTOR',
                          style: TextStyle(
                              fontSize: 22.sp, color: const Color(0xFFF49F38)),
                        ),
                        Text(
                          'ComSeñas',
                          style: TextStyle(
                            fontSize: 46.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFF49F38),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    // Opciones de cámara y texto/voz
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  boton izquierda
                        Column(
                          children: [
                            _islanguageExchange
                                ? Image.asset(
                                    'assets/icons/camara.png',
                                    height: 90.h,
                                    width: 90.w,
                                  )
                                : Image.asset(
                                    'assets/icons/audio_texto.png',
                                    height: 90.h,
                                    width: 90.w,
                                  ),
                            SizedBox(height: 5.h),
                            Text(
                              _islanguageExchange ? 'Camara' : 'Texto / Voz',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        // Boton de intercambio
                        IconButton(
                          icon: Icon(
                            Icons.swap_horiz,
                            color: Colors.white,
                            size: 40.sp,
                          ),
                          onPressed: _languageExchange,
                        ),
                        SizedBox(width: 20.w),
                        // Boton derecha
                        Column(
                          children: [
                            !_islanguageExchange
                                ? Image.asset(
                                    'assets/icons/camara.png',
                                    height: 90.h,
                                    width: 90.w,
                                  )
                                : Image.asset(
                                    'assets/icons/texto_audio.png',
                                    height: 90.h,
                                    width: 90.w,
                                  ),
                            SizedBox(height: 5.h),
                            Text(
                              !_islanguageExchange ? 'Camara' : 'Voz / Texto',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    // Boton comenzar
                    SizedBox(
                      width: 280.w,
                      height: 45.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => _islanguageExchange
                                  ? SignTranslatorPage()
                                  : TextTranslatorPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F509D),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        child: Text(
                          'COMENZAR',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Row fijo al fondo a la izquierda
            Positioned(
              bottom: 10.h, // Espaciado desde el fondo
              right: 10.w,
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/home.png',
                    height: 50.h,
                    color: const Color(0xFF2F509D),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    icon: Image.asset(
                      'assets/icons/perfil.png',
                      height: 50.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
