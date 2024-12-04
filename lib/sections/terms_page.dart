import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/sections/services_page.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool isChecked = false; // Variable para controlar el estado del checkbox

  @override
  Widget build(BuildContext context) {
    // Inicializamos ScreenUtil
    ScreenUtil.init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'), // Fondo de la pantalla
            fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Términos y condiciones",
                        style: TextStyle(
                          fontSize: 20.sp, // Usar .sp para el tamaño de fuente
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/logo.png', // Ruta de la imagen del logo
                        height: 60.h, // Usar .h para la altura de la imagen
                        width: 60.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h), // Espaciado dinámico
                  Text(
                    "El usuario se compromete a leer los términos y condiciones aquí establecidas, previamente a ú descarga de la aplicación, por tanto, en caso de realzar la instalación se entiende que cuenta con el conocimiento integral de este documento y la consecuente aceptación de la totalidad de sus estipulaciones.\n\n El Usuario reconoce que el ingreso de su información persona, y los datos que contiene la aplicación a su disposición respecto a los servicios brindados por la app ComSeñas, la realizan de manera voluntaria, quienes optan por acceder a esta aplicación en Colombia, lo hacen por iniciativa propia y son respondables del cumplimiento de las leyes locales, en la medida en que dichas leyes sean aplicables en su correspondiente país.\n\n En la aplicación se pondrá a disposición del CLIENTE información y/o permitirá la realización de las transacciones determinadas o habitadas por ComSeñas para cada producto en particular. ComSeñas podrá adicionar, modificar o eliminar las funcionalidades en cualquier momento, lo cual acepta el usuario mediante la instalación de la aplicación. En todo caso, al momento de realizar dichas modificaciones se notificarán al usuario a través de la misma aplicación móvil una vez inicie sesión.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked,
                        checkColor: const Color(0xFFF49F38),
                        activeColor: const Color.fromARGB(0, 0, 64, 214),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Flexible(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Text(
                              'Acepto los términos y condiciones',
                              softWrap:
                                  true, // Permite que el texto se ajuste a la línea
                              maxLines: 2, overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize:
                                    15.sp, // Usar .sp para el tamaño de fuente
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h), // Espaciado dinámico
                  SizedBox(
                    width: 300.w,
                    height: 45.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!isChecked) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Debe aceptar los terminos y condiciones para continuar'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          return;
                        } else {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ServicesPage()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F509D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        'CONTINUAR',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.sp, // Usar .sp para el tamaño de fuente
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
