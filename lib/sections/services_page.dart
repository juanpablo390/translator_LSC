
import 'package:flutter/material.dart';
import 'package:translate_lsc/sections/home_page.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "PLANES DE SERVICIO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPlanCard(
                  context,
                  'Gratis',
                  '0 \$',
                  '• Acceso al traductor 3 veces al día.\n• Contenido de anuncios publicitarios.',
                  ' GO NOW ',
                ),
                const SizedBox(width: 10),
                buildPlanCard(
                  context,
                  'BÁSICO',
                  '35.000 \$',
                  '• Suscripción por 30 dias.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                  'BUY NOW',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildPlanCard(
                  context,
                  'ESTANDAR',
                  '70.000 \$',
                  '• Suscripción por 6 meses.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                  'BUY NOW',
                ),
                buildPlanCard(
                    context,
                    'PREMIUM',
                    '600.000 \$',
                    '• Suscripción por 12 meses.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                    'BUY NOW'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlanCard(BuildContext contextButton, String title, String price,
      String description, String buttonText) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            border: Border.all(color: const Color(0xFF032868), width: 5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await Navigator.push(
              contextButton,
              MaterialPageRoute(
                  builder: (context) => const HomePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF032868),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
