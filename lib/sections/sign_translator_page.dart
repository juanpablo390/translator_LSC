import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate_lsc/componentes/links_drawer.dart';
import 'package:translate_lsc/sections/home_page.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class SignTranslatorPage extends StatefulWidget {
  const SignTranslatorPage({super.key});

  @override
  State<SignTranslatorPage> createState() => _SignTranslatorPageState();
}

class _SignTranslatorPageState extends State<SignTranslatorPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  final FlutterTts flutterTts = FlutterTts(); // Instancia de FlutterTts
  File? _videoFile;
  String apiResponse = ''; // Variable para almacenar la respuesta de la API
  bool isLoading = false; // Estado de carga para mostrar el indicador

  @override
  void initState() {
    super.initState();
  }

  // Función para seleccionar un video desde la galería
  Future<void> _pickVideoFake() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        isLoading = true; // Muestra el indicador de carga
        apiResponse = ''; // Limpia la respuesta previa mientras espera la nueva
      });
      await Future.delayed(const Duration(seconds: 3), () {});
      setState(() {
        isLoading = false; // deja de mostrar el indicador de carga
        apiResponse =
            'Hola Valentina, estoy bien, ¿y tú? Mi nombre es Sharith, tengo 23 años y también soy estudiante de la Universidad de Pamplona. Mucho gusto.';
      });
    }
  }

  // Función para seleccionar un video desde la galería
  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
      _uploadVideo();
    }
  }

  // Función para grabar un video
  Future<void> _recordVideo() async {
    final recordedFile = await _picker.pickVideo(source: ImageSource.camera);
    if (recordedFile != null) {
      setState(() {
        _videoFile = File(recordedFile.path);
      });
      _uploadVideo();
    }
  }

  // Función para subir el video a la API y actualizar la respuesta
  Future<void> _uploadVideo() async {
    if (_videoFile == null) return;

    setState(() {
      isLoading = true; // Muestra el indicador de carga
      apiResponse = ''; // Limpia la respuesta previa mientras espera la nueva
    });

    final url = Uri.parse(
        'https://topical-mosquito-internally.ngrok-free.app/upload_video');
    final mimeType = lookupMimeType(_videoFile!.path) ?? 'video/mp4';

    var request = http.MultipartRequest('POST', url);
    request.files.add(
      http.MultipartFile(
        'video',
        _videoFile!.readAsBytes().asStream(),
        _videoFile!.lengthSync(),
        filename: path.basename(_videoFile!.path),
        contentType: MediaType('video', mimeType.split('/').last),
      ),
    );

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        setState(() {
          apiResponse =
              formatSentence(responseData); // Actualiza la respuesta de la API
          isLoading = false; // Oculta el indicador de carga
        });
      } else {
        setState(() {
          apiResponse = 'Error al subir el video: ${response.statusCode}';
          isLoading = false; // Oculta el indicador de carga
        });
      }
    } catch (e) {
      setState(() {
        apiResponse = 'Excepción: $e';
        isLoading = false; // Oculta el indicador de carga en caso de error
      });
    }
  }

  //Funcion de audio
  Future<void> _speak() async {
    if (apiResponse.isNotEmpty) {
      await flutterTts.setPitch(3.0); // Ajusta el tono (1.0 es el valor normal)
      await flutterTts.setSpeechRate(
          0.3); // Ajusta la velocidad (0.5 - 1.5 es el rango usual)
      await flutterTts.setVolume(1.0); // Ajusta el volumen (0.0 a 1.0)
      await flutterTts
          .setLanguage("es-MX"); // o usa "es-CO" para español de Colombia
      await flutterTts.speak(apiResponse);
    }
  }

 String formatSentence(String input) {
  // Separar las palabras por el guion
  List<String> words = input.split('-');

  // Verificar si la lista no está vacía
  if (words.isEmpty) return "";

  // Formatear la oración
  String sentence = words.map((word) => word.trim()).join(' ');
  
  // Convertir la primera palabra en mayúscula
  sentence = sentence[0].toUpperCase() + sentence.substring(1).toLowerCase();

  // Verificar si la frase contiene "como estas"
  if (sentence.contains("estas")) {
    // Reemplazar "como estas" para asegurar que termine con "?"
    sentence = sentence.replaceAll("estas", "estas?");
  }

  // Asegurar que la frase termine con un punto si no tiene otros signos
  if (!sentence.endsWith('.') && !sentence.endsWith('?') && !sentence.endsWith('!')) {
    sentence += '.';
  }

  return sentence;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: LinksDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Icono de menú en la esquina superior izquierda y títulos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botón de menú hamburguesa en la esquina superior izquierda
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                // Logo, título y subtítulo
                const SizedBox(height: 20),
                Image.asset(
                  'assets/icons/logo.png',
                  height: 180,
                ),
              ],
            ),
            const SizedBox(height: 50),
            // Contenedor central (para el área de traducción)
            Container(
              width: 320,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // Área para mostrar el texto o el indicador de carga
                  Center(
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Color(0xFF2F509D)) // Indicador de carga
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              apiResponse,
                              maxLines: null,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                  ),
                  // Icono de volumen
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.volume_up_rounded,
                        size: 40,
                        color: Colors.black,
                      ),
                      onPressed:
                          _speak, // Llama a la función para leer el texto
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 320,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.video_collection_rounded,
                      color: const Color(0xFF2F509D),
                      size: 45,
                    ),
                    onPressed: _pickVideo,
                  ),
                  //prueba--------------------------------------------
                  IconButton(
                    icon: Icon(
                      Icons.horizontal_rule_sharp,
                      color: const Color(0xFF2F509D),
                      size: 50,
                    ),
                    onPressed: _pickVideoFake,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.video_camera_front_rounded,
                      color: const Color(0xFF2F509D),
                      size: 50,
                    ),
                    onPressed: _recordVideo,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Iconos de la parte baja
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/icons/texto_audio.png',
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/icons/home.png',
                          height: 55,
                          color: const Color(0xFF2F509D),
                        )),
                    Image.asset(
                      'assets/icons/perfil.png',
                      height: 55,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
