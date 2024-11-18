import 'package:flutter/material.dart';
import 'package:translate_lsc/sections/terms_page.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/icons/fondo.png'), // Cambia esto por la ruta de tu imagen
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            ),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          Image.asset(
                            'assets/icons/logo.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 300,
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ComSeñas',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight
                                        .bold, // Solo ComSeñas en negrita
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' es una aplicación móvil de fácil acceso, que ofrece un servicio completo de un traductor automático desarrollado para traducir voz y vídeo en tiempo real de la lengua de señas, lo cual facilita la comunicación entre personas oyentes y no oyentes.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight
                                        .normal, // Resto del texto sin negrita
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsPage()),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Términos y condiciones',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ))
                        ])))));
  }
}
