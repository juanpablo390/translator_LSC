import 'package:flutter/material.dart';
import 'package:translate_lsc/sections/login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  RegisterPage({super.key});

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
                const SizedBox(height: 70),
                const Text(
                  "Crea una \n cuenta nueva",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Text(
                    'Usuario',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está habilitado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está enfocado
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está habilitado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está enfocado
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está habilitado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está enfocado
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Text(
                    'Fecha de nacimiento',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _birthDateController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está habilitado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está enfocado
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Text(
                    'Sexo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _genderController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está habilitado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Colors
                              .grey), // Color del borde cuando el campo está enfocado
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 68, 68, 68),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Radio de esquina
                    ),
                  ),
                  child: const Text(
                    'REGISTRAR',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
