import 'package:flutter/material.dart';
import 'package:translate_lsc/componentes/links_drawer.dart';
import 'package:translate_lsc/sections/sign_translator_page.dart';
import 'package:translate_lsc/sections/text_translator_page.dart';

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
    return Scaffold(
      key: _scaffoldKey,
      drawer: LinksDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Botón de menú hamburguesa en la esquina superior izquierda
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                const Text(
                  "Shary Ortega",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            /* Logo titulo y subtitulo */
            Column(
              children: [
                Image.asset(
                  'assets/icons/logo_2.png',
                  height: 200,
                ),
                Text(
                  'TRADUCTOR',
                  style: TextStyle(fontSize: 26, color: const Color(0xFFF49F38)),
                ),
                Text(
                  'ComSeñas',
                  style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF49F38)),
                ),
              ],
            ),
            const SizedBox(height: 50),
            /* Iconos de camara y audio */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _islanguageExchange
                        ? Image.asset(
                            'assets/icons/camara.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          )
                        : Image.asset(
                            'assets/icons/audio_texto.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          ),
                    const SizedBox(height: 5),
                    Text(_islanguageExchange ? 'Camara' : 'Texto / Voz',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.swap_horiz,
                      color: Colors.white, size: 40),
                  onPressed: _languageExchange,
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    !_islanguageExchange
                        ? Image.asset(
                            'assets/icons/camara.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          )
                        : Image.asset(
                            'assets/icons/texto_audio.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          ),
                    const SizedBox(height: 5),
                    Text(!_islanguageExchange ? 'Camara' : 'Voz / Texto',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            /*  Botón de comenzar */
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _islanguageExchange
                          ? SignTranslatorPage()
                          : TextTranslatorPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F509D),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              child: const Text(
                'COMENZAR',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Spacer(),
            /* Iconos de Home y Perfil */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/icons/home.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                  height: 55,
                  color: const Color(0xFF2F509D),
                ),
                Image.asset(
                  'assets/icons/perfil.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                  height: 55,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
