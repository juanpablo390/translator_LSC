import 'package:flutter/material.dart';
import 'package:translate_lsc/sections/services_page.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool isChecked = false;
  // Variable para controlar el estado del checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                          const SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Términos y condiciones",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              Image.asset(
                                'assets/icons/logo.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                                height: 60,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "El usuario se compromete a leer los términos y condiciones aquí establecidas, previamente a ú descarga de la aplicación, por tanto, en caso de realzar la instalación se entiende que cuenta con el conocimiento integral de este documento y la consecuente aceptación de la totalidad de sus estipulaciones.\n El Usuario reconoce que el ingreso de su información persona, y los datos que contiene la aplicación a su disposición respecto a los servicios brindados por la app ComSeñas, la realizan de manera voluntaria, quienes optan por acceder a esta aplicación en Colombia, lo hacen por iniciativa propia y son respondables del cumplimiento de las leyes locales, en la medida en que dichas leyes sean aplicables en su correspondiente país.\n\n En la aplicación se pondrá a disposición del CLIENTE información y/o permitirá la realización de las transacciones determinadas o habitadas por ComSeñas para cada producto en particular. ComSeñas podrá adicionar, modificar o eliminar las funcionalidades en cualquier momento, lo cual acepta el usuario mediante la instalación de la aplicación. En todo caso, al momento de realizar dichas modificaciones se notificarán al usuario a través de la misma aplicación móvil una vez inicie sesión.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue!;
                                  });
                                },
                              ),
                              const Text(
                                'Acepto los términos y condiciones',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ServicesPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 68, 68, 68),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 105, vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Text(
                              'CONTINUAR',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ])))));
  }
}
