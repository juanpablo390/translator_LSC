import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Importar la librería
import 'package:translate_lsc/sections/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String? _selectedGender;

  final _formKey = GlobalKey<FormState>();

  void _selectBirthDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthDateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Aquí iría la lógica de registro
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Inicializamos ScreenUtil
    ScreenUtil.init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w), // Usamos 'w' para la dimensión
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Crea una \n cuenta nueva",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.sp, // Usamos 'sp' para tamaño de texto
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF49F38),
                      ),
                    ),
                  ),
                  const Divider(color: Color(0xFF062959), thickness: 2),
                  SizedBox(height: 20.h), // Usamos 'h' para el alto de espacio
                  _buildLabel('Usuario'),
                  _buildTextField(_nameController, "Ingresa tu usuario"),
                  SizedBox(height: 20.h),
                  _buildLabel('Email'),
                  _buildTextField(_emailController, "Ingresa tu correo",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(height: 20.h),
                  _buildLabel('Contraseña'),
                  _buildTextField(
                    _passwordController,
                    "Crea una contraseña",
                    obscureText: true,
                  ),
                  SizedBox(height: 20.h),
                  _buildLabel('Fecha de nacimiento'),
                  TextFormField(
                    controller: _birthDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectBirthDate(context),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecciona tu fecha de nacimiento";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  _buildLabel('Sexo'),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    items: const [
                      DropdownMenuItem(value: "Masculino", child: Text("Masculino")),
                      DropdownMenuItem(value: "Femenino", child: Text("Femenino")),
                      DropdownMenuItem(value: "Otro", child: Text("Otro")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecciona tu género";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  const Divider(color: Color(0xFF062959), thickness: 2),
                  SizedBox(height: 10.h),
                  Center(
                    child: SizedBox(
                      width: 0.8.sw, // 80% del ancho de la pantalla
                      height: 0.065.sh, // 6.5% de la altura de la pantalla
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 72, 73, 75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                            fontSize: 18.sp, // Usamos 'sp' para texto adaptado
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF062959),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Este campo no puede estar vacío";
        }
        return null;
      },
    );
  }
}
