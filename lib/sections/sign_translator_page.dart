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
  _SignTranslatorPageState createState() => _SignTranslatorPageState();
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
    _recordVideo(); // Inicia la grabación de video al entrar en la vista
  }

  // Función para seleccionar un video desde la galería
  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
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

    final url = Uri.parse('http://192.168.0.6:5000/upload_video');
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
          apiResponse = responseData; // Actualiza la respuesta de la API
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

  Future<void> _speak() async {
  if (apiResponse.isNotEmpty) {
    await flutterTts.setPitch(1.0); // Ajusta el tono (1.0 es el valor normal)
    await flutterTts.setSpeechRate(0.6); // Ajusta la velocidad (0.5 - 1.5 es el rango usual)
    await flutterTts.setVolume(1.0); // Ajusta el volumen (0.0 a 1.0)
    await flutterTts.setLanguage("es-MX"); // o usa "es-CO" para español de Colombia
    await flutterTts.speak(apiResponse);
  }
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
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // Área para mostrar el texto o el indicador de carga
                  Center(
                    child: isLoading
                        ? const CircularProgressIndicator(color:  Color(0xFF2F509D)) // Indicador de carga
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Text(
                              apiResponse,
                              maxLines: null,
                              style: const TextStyle(fontSize: 18, color: Colors.black),
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
                      onPressed: _speak, // Llama a la función para leer el texto
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/camara.png',
                height: 100,
              ),
              onPressed: _recordVideo,
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
                            MaterialPageRoute(builder: (context) => const HomePage()),
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
