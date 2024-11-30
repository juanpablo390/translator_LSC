import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/sections/home_page.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializamos ScreenUtil para que las unidades responsivas funcionen
    ScreenUtil.init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, 
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/fondo.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10.0.sp),
          child: Column(
            children: [
              // Título de la sección
              Text(
                "PLANES DE SERVICIO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10.h),
              
              // Row de los planes
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
              
              // Row con los otros dos planes
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
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir las tarjetas de los planes
  Widget buildPlanCard(BuildContext contextButton, String title, String price,
      String description, String buttonText) {
    return Column(
      children: [
        Container(
          width: 120.w,
          height: 250.h, 
          padding: EdgeInsets.symmetric(vertical: 8.sp),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            border: Border.all(color: const Color(0xFF032868), width: 5.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await Navigator.push(
              contextButton,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF032868),
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 1.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.sp)),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
