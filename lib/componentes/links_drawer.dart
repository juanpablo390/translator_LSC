import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksDrawer extends StatelessWidget {
  const LinksDrawer({super.key});

  Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.platformDefault);  // Cambié externalApplication a platformDefault
  } else {
    throw 'Could not launch $urlString';
  }
}
  


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 88, 219),
            ),
            child: Text(
              'Cursos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text("Curso gratis"),
            onTap: () =>
                _launchURL("https://educativo.insor.gov.co/diccionario/"),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text("Curso de pago"),
            onTap: () =>
                _launchURL("https://lscolombiana.com/index.php/curso-lsc/"),
          )
        ],
      ),
    );
  }
}
