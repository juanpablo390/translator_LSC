import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Importar la librería
import 'package:translate_lsc/sections/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String? _selectedGender;

  final _formKey = GlobalKey<FormState>();

  Future<void> _selectBirthDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                Color(0xFF2F509D), // Color principal (barra superior y botones)
            hintColor: Color(0xFFF49F38), // Color para el ícono de selección
            colorScheme: ColorScheme.light(
              primary: Color(0xFF2F509D), // Color principal
              onPrimary:
                  Colors.white, // Color del texto sobre el color principal
              onSurface: Colors.black, // Color del texto en general
            ),
            dialogBackgroundColor: Colors.white, // Fondo del calendario
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFFF49F38), // Color del botón de texto
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _birthDateController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
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
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Titulo
                  Center(
                    child: Text(
                      "Crea una \n cuenta nueva",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF49F38),
                      ),
                    ),
                  ),
                  // Divider
                  const Divider(color: Color(0xFF2F509D), thickness: 2),
                  SizedBox(height: 15.h),
                  // Label Usuario
                  _buildLabel('Usuario'),
                  _buildTextField(_nameController, "Ingresa tu usuario"),
                  SizedBox(height: 15.h),
                  // Label Email
                  _buildLabel('Email'),
                  _buildTextField(_emailController, "Ingresa tu correo",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(height: 15.h),
                  // Label Password
                  _buildLabel('Contraseña'),
                  _buildTextField(
                    _passwordController,
                    "Crea una contraseña",
                    obscureText: true,
                  ),
                  SizedBox(height: 15.h),
                  // Label Fecha de nacimiento
                  _buildLabel('Fecha de nacimiento'),
                  TextFormField(
                    controller: _birthDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month_rounded),
                        onPressed: () => _selectBirthDate(context),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF2F509D),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: const Color(0xFFF49F38),
                          width: 1.5,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecciona tu fecha de nacimiento";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),
                  // Label Sexo
                  _buildLabel('Sexo'),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    items: const [
                      DropdownMenuItem(
                          value: "Masculino", child: Text("Masculino")),
                      DropdownMenuItem(
                          value: "Femenino", child: Text("Femenino")),
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF2F509D),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: const Color(0xFFF49F38),
                          width: 1.5,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecciona tu género";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),
                  // Divider
                  const Divider(color: Color(0xFF2F509D), thickness: 2),
                  SizedBox(height: 15.h),
                  Center(
                    child: SizedBox(
                      width: 300.w,
                      height: 45.h,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F509D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Registrar',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
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
        fontWeight: FontWeight.w600,
        color: const Color(0xFF26407E),
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xFF2F509D),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: const Color(0xFFF49F38),
            width: 1.5,
          ),
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
