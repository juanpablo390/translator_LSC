import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/sections/home_page.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding:
            EdgeInsets.all(30.w), // Usando ScreenUtil para tamaños adaptables
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // titulo
                Text(
                  "PLANES DE SERVICIO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:
                        30.sp, // Usando ScreenUtil para el tamaño de fuente
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildPlanCard(
                      context,
                      'Gratis',
                      '0 \$',
                      '• Acceso al traductor 5 veces al día.\n• Contenido de anuncios publicitarios.',
                      'GO NOW',
                    ),
                    SizedBox(width: 10.w),
                    buildPlanCard(
                      context,
                      'BÁSICO',
                      '70.000 \$',
                      '• Suscripción por 30 días.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                      'BUY NOW',
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildPlanCard(
                      context,
                      'ESTANDAR',
                      '360.000 \$',
                      '• Suscripción por 6 meses.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                      'BUY NOW',
                    ),
                    buildPlanCard(
                      context,
                      'PREMIUM',
                      '600.000 \$',
                      '• Suscripción por un año.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                      'BUY NOW',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPlanCard(BuildContext contextButton, String title, String price,
      String description, String buttonText) {
    return Column(
      children: [
        Container(
          width: 130.w, // Ajuste del ancho con ScreenUtil
          height: 220.h, // Ajuste de la altura con ScreenUtil
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            border: Border.all(color: const Color(0xFF032868), width: 3.w),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            // Agregar un scroll dentro del card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 35.h,
          width: 110.w,
          child: ElevatedButton(
            onPressed: () async {
              if (buttonText == 'GO NOW') {
                await Navigator.push(
                  contextButton,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (buttonText == 'BUY NOW') {
                showDialog(
                  context: contextButton,
                  builder: (context) => AlertDialog(
                    title: const Text('Información'),
                    content: const Text('Por favor, comuníquese con nosotros al +57 999 999 999 para más información sobre la compra de nuestros servicios.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF032868),
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
