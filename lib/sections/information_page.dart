import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/sections/terms_page.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w), // Usar .w para el ancho
            child: SingleChildScrollView( // Aseguramos que todo sea desplazable
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 300.h, // Usar .h para la altura de la imagen
                    width: 300.w,
                  ),
                  SizedBox(height: 25.h), // Espaciado dinámico
                  // Evitar constante en el TextSpan
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'ComSeñas',
                          style: TextStyle(
                            fontSize: 24.sp, // Usar .sp para el tamaño de fuente
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' es una aplicación móvil de fácil acceso, que ofrece un servicio completo de un traductor automático desarrollado para traducir voz y vídeo en tiempo real de la lengua de señas, lo cual facilita la comunicación entre personas oyentes y no oyentes.',
                          style: TextStyle(
                            fontSize: 18.sp, // Usar .sp para el tamaño de fuente
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h), // Espaciado dinámico
                  TextButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TermsPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                          size: 30.sp, // Usar .sp para el tamaño de icono
                        ),
                        SizedBox(width: 10.w), // Espaciado dinámico entre icono y texto
                        Text(
                          'Términos y condiciones',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.sp, // Usar .sp para el tamaño de texto
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
