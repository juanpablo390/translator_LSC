import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksDrawer extends StatelessWidget {
  const LinksDrawer({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      throw 'No se pudo abrir el enlace: $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Encabezado con gradiente y estilo personalizado
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 59, 115, 247),
                  const Color(0xFF2F509D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.book,
                  size: 64,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Cursos y Recursos',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Aprende Lengua de Señas',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Lista de opciones
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.auto_stories,
                      color: const Color(0xFF2F509D), size: 28),
                  title: const Text(
                    "Curso gratuito",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Inicia gratis en INSOR"),
                  onTap: () =>
                      _launchURL("https://educativo.insor.gov.co/diccionario/"),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.payment,
                      color: const Color(0xFFF49F38), size: 28),
                  title: const Text(
                    "Curso premium",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Aprende con expertos en LSC"),
                  onTap: () => _launchURL(
                      "https://lscolombiana.com/index.php/curso-lsc/"),
                ),
              ],
            ),
          ),

          // Mensaje final decorativo
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Invierte en tu aprendizaje, la lengua de señas abre nuevas puertas 🌟",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
