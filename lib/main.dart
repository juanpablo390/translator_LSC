import 'package:flutter/material.dart';

void main() {
  runApp(const TraductorComSenhasApp());
}

class TraductorComSenhasApp extends StatelessWidget {
  const TraductorComSenhasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

//----------------------------------------------------------

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
                'assets/fondo.png'), // Cambia esto por la ruta de tu imagen
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
                  'assets/logo.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  'BIENVENIDOS',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[700],
                  ),
                ),
                const SizedBox(height: 60),
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
                    backgroundColor: const Color.fromARGB(255, 68, 68, 68),
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

//----------------------------------------------------------

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
                'assets/fondo.png'), // Cambia esto por la ruta de tu imagen
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

//----------------------------------------------------------

class TraductorHomePage extends StatefulWidget {
  const TraductorHomePage({super.key});

  @override
  State<TraductorHomePage> createState() => _TraductorHomePageState();
}

class _TraductorHomePageState extends State<TraductorHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _islanguageExchange = false;

  void _languageExchange() {
    setState(() {
      _islanguageExchange = !_islanguageExchange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 88, 219),
              ),
              child: Text(
                'Cursos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Opción 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Botón de menú hamburguesa en la esquina superior izquierda
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                const Text(
                  "Shary Ortega",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 50),
            /* Logo titulo y subtitulo */
            Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
                Text(
                  'TRADUCTOR',
                  style: TextStyle(fontSize: 26, color: Colors.yellow[700]),
                ),
                Text(
                  'ComSeñas',
                  style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700]),
                ),
              ],
            ),
            const SizedBox(height: 100),
            /* Iconos de camara y audio */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _islanguageExchange
                        ? Image.asset(
                            'assets/camara.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          )
                        : Image.asset(
                            'assets/audio_texto.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          ),
                    const SizedBox(height: 5),
                    Text(_islanguageExchange ? 'Camara' : 'Texto / Voz',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.swap_horiz,
                      color: Colors.white, size: 40),
                  onPressed: _languageExchange,
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    !_islanguageExchange
                        ? Image.asset(
                            'assets/camara.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          )
                        : Image.asset(
                            'assets/texto_audio.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 100,
                          ),
                    const SizedBox(height: 5),
                    Text(!_islanguageExchange ? 'Camara' : 'Voz / Texto',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            /*  Botón de comenzar */
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 240, 171),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              child: const Text(
                'COMENZAR',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Spacer(),
            /* Iconos de Home y Perfil */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/home.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                  height: 55,
                  color: Colors.blue[900],
                ),
                Image.asset(
                  'assets/perfil.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                  height: 55,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/fondo.png'), // Cambia esto por la ruta de tu imagen
                fit: BoxFit.cover, // Ajusta cómo se muestra la imagen
              ),
            ),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          Image.asset(
                            'assets/logo.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
                            height: 300,
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ComSeñas',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight
                                        .bold, // Solo ComSeñas en negrita
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' es una aplicación móvil de fácil acceso, que ofrece un servicio completo de un traductor automático desarrollado para traducir voz y vídeo en tiempo real de la lengua de señas, lo cual facilita la comunicación entre personas oyentes y no oyentes.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight
                                        .normal, // Resto del texto sin negrita
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TerminosPage()),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Términos y condiciones',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ))
                        ])))));
  }
}

//----------------------------------------------------------

class TerminosPage extends StatefulWidget {
  const TerminosPage({super.key});

  @override
  State<TerminosPage> createState() => _TerminosPageState();
}

class _TerminosPageState extends State<TerminosPage> {
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
                    'assets/fondo.png'), // Cambia esto por la ruta de tu imagen
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
                                'assets/logo.png', // Asegúrate de que la ruta coincida con la del pubspec.yaml
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
                                        const PlanesDeServicioPage()),
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

//----------------------------------------------------------

class PlanesDeServicioPage extends StatelessWidget {
  const PlanesDeServicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/fondo.png'), // Cambia esto por la ruta de tu imagen
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
                  'FREE',
                  'Acceso gratuito',
                  '• Acceso al traductor 3 veces al día.\n• Contenido de anuncios publicitarios.',
                  ' GO NOW ',
                ),
                const SizedBox(width: 10),
                buildPlanCard(
                  context,
                  'QUINCENAL',
                  '35.000 \$',
                  '• 0 - 15 días.\n• Acceso limitado al traductor.\n• Sin contenido de anuncios publicitarios.',
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
                  'MENSUAL',
                  '70.000 \$',
                  '• 0 - 30 días.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                  'BUY NOW',
                ),
                buildPlanCard(
                  context,
                  'SEMESTRAL',
                  '360.000 \$',
                  '• 6 meses.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
                  'BUY NOW',
                ),
                buildPlanCard(
                    context,
                    'ANUAL',
                    '600.000 \$',
                    '• 12 meses.\n• Acceso ilimitado al traductor.\n• Sin contenido de anuncios publicitarios.',
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
                  builder: (context) => const TraductorHomePage()),
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

//----------------------------------------------------------

