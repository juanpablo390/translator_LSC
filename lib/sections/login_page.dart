import 'package:flutter/material.dart';
import 'package:translate_lsc/sections/information_page.dart';
import 'package:translate_lsc/sections/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_userController.text == 'user' &&
        _passwordController.text == 'password') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InformationPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Usuario o contraseña incorrectos'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  bool _isObscured = true; // Controla si el texto está oculto

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
                Image.asset(
                  'assets/icons/logo.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                  height: 250,
                ),
                Text(
                  'BIENVENIDOS',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF49F38),
                  ),
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment:
                      Alignment.centerLeft, // Alinea el texto a la izquierda
                  child: Text(
                    'Usuario',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _userController,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF062959),
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _isObscured,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured
                            ? Icons.visibility_off
                            : Icons.visibility, // Cambia el ícono
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured; // Alterna la visibilidad
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F509D),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 105, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Radio de esquina
                    ),
                  ),
                  child: const Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text(
                    '¿No tienes cuenta? Regístrate aquí',
                    style: TextStyle(color: Colors.white),
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
