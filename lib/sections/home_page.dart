import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/componentes/links_drawer.dart';
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
        child: SingleChildScrollView(
          // Aseguramos que el contenido sea desplazable
          child: Container(
            padding: EdgeInsets.all(10.w), // Usamos ScreenUtil para padding

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Botón de menú hamburguesa en la esquina superior izquierda
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu,
                          color: Colors.black,
                          size: 30
                              .sp), // Usamos ScreenUtil para el tamaño del icono
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    Text(
                      "Shary Ortega",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                            .sp, // Usamos ScreenUtil para el tamaño de la fuente
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 10
                        .h), // Usamos ScreenUtil para el espacio entre widgets
                // Logo titulo y subtitulo
                Column(
                  children: [
                    Image.asset(
                      'assets/icons/logo_2.png',
                      height: 150.h,
                      width: 150
                          .w, // Usamos ScreenUtil para el tamaño de la imagen
                    ),
                    Text(
                      'TRADUCTOR',
                      style: TextStyle(
                          fontSize: 24.sp, color: const Color(0xFFF49F38)),
                    ),
                    Text(
                      'ComSeñas',
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF49F38),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 40
                        .h), // Usamos ScreenUtil para el tamaño de la separación
                // Iconos de camara y audio
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        _islanguageExchange
                            ? Image.asset(
                                'assets/icons/camara.png',
                                height: 100.h,
                                width:
                                    100.w, // Usamos ScreenUtil para el tamaño
                              )
                            : Image.asset(
                                'assets/icons/audio_texto.png',
                                height: 100.h,
                                width: 100.w,
                              ),
                        SizedBox(height: 5.h),
                        Text(
                          _islanguageExchange ? 'Camara' : 'Texto / Voz',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                                .sp, // Usamos ScreenUtil para el tamaño de la fuente
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 20
                            .w), // Usamos ScreenUtil para el tamaño de separación
                    IconButton(
                      icon: Icon(
                        Icons.swap_horiz,
                        color: Colors.white,
                        size:
                            40.sp, // Usamos ScreenUtil para el tamaño del icono
                      ),
                      onPressed: _languageExchange,
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      children: [
                        !_islanguageExchange
                            ? Image.asset(
                                'assets/icons/camara.png',
                                height: 100.h,
                                width: 100.w,
                              )
                            : Image.asset(
                                'assets/icons/texto_audio.png',
                                height: 100.h,
                                width: 100.w,
                              ),
                        SizedBox(height: 5.h),
                        Text(
                          !_islanguageExchange ? 'Camara' : 'Voz / Texto',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                ElevatedButton(
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 80.w,
                        vertical: 15.h), // Usamos ScreenUtil para padding
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: Text(
                    'COMENZAR',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18
                          .sp, // Usamos ScreenUtil para el tamaño de la fuente
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                    height: 50
                        .h), // Separación para que el contenido no quede pegado a los iconos de abajo
                // Iconos de Home y Perfil
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/icons/home.png',
                      height: 55.h,
                      color: const Color(0xFF2F509D),
                    ),
                    Image.asset(
                      'assets/icons/perfil.png',
                      height: 55.h,
                    ),
                  ],
                ),
                SizedBox(height: 10.h), // Se agrega un pequeño margen al final
              ],
            ),
          ),
        ),
      ),
    );
  }
}
