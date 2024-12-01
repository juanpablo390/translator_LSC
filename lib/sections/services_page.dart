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
        padding: EdgeInsets.all(10.0.w), // Usando ScreenUtil para tamaños adaptables
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h), // Uso de ScreenUtil para ajustar el espacio
              Text(
                "PLANES DE SERVICIO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp, // Usando ScreenUtil para el tamaño de fuente
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10.h),
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
                  SizedBox(width: 10.w),
                  buildPlanCard(
                    context,
                    'BÁSICO',
                    '35.000 \$',
                    '• Suscripción por 30 días.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                    'BUY NOW',
                  ),
                ],
              ),
              SizedBox(height: 16.h),
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
                    'BUY NOW',
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
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
          width: 120.w, // Ajuste del ancho con ScreenUtil
          height: 300.h, // Ajuste de la altura con ScreenUtil
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            border: Border.all(color: const Color(0xFF032868), width: 5.w),
          ),
          child: SingleChildScrollView( // Agregar un scroll dentro del card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 40.h,
          width: 110.w,
          child: ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                contextButton,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF032868),
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
