import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  SignTranslatorPage({super.key});

  @override
  State<SignTranslatorPage> createState() => _SignTranslatorPageState();
}

class _SignTranslatorPageState extends State<SignTranslatorPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  final FlutterTts flutterTts = FlutterTts();
  File? _videoFile;
  String apiResponse = '';
  bool isLoading = false;

  Future<void> _pickVideoFake() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        isLoading = true;
        apiResponse = '';
      });
      await Future.delayed(Duration(seconds: 3), () {});
      setState(() {
        isLoading = false;
        apiResponse =
            'Hola Valentina, estoy bien, ¿y tú? Mi nombre es Sharith, tengo 23 años y también soy estudiante de la Universidad de Pamplona. Mucho gusto.';
      });
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
      _uploadVideo();
    }
  }

  Future<void> _recordVideo() async {
    final recordedFile = await _picker.pickVideo(source: ImageSource.camera);
    if (recordedFile != null) {
      setState(() {
        _videoFile = File(recordedFile.path);
      });
      _uploadVideo();
    }
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) return;

    setState(() {
      isLoading = true;
      apiResponse = '';
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
          apiResponse = formatSentence(responseData);
          isLoading = false;
        });
      } else {
        setState(() {
          apiResponse = 'Error al subir el video: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        apiResponse = 'Excepción: $e';
        isLoading = false;
      });
    }
  }

  Future<void> _speak() async {
    if (apiResponse.isNotEmpty) {
      await flutterTts.setPitch(3.0);
      await flutterTts.setSpeechRate(0.3);
      await flutterTts.setVolume(1.0);
      await flutterTts.setLanguage("es-MX");
      await flutterTts.speak(apiResponse);
    }
  }

  String formatSentence(String input) {
    List<String> words = input.split('-');
    if (words.isEmpty) return "";
    String sentence = words.map((word) => word.trim()).join(' ');
    sentence = sentence[0].toUpperCase() + sentence.substring(1).toLowerCase();
    if (sentence.contains("estas")) {
      sentence = sentence.replaceAll("estas", "estas?");
    }
    if (!sentence.endsWith('.') &&
        !sentence.endsWith('?') &&
        !sentence.endsWith('!')) {
      sentence += '.';
    }
    return sentence;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: LinksDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black, size: 30.sp),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 150.h,
                    width: 150.w,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Container(
                width: 280.w,
                height: 250.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: isLoading
                          ? CircularProgressIndicator(color: Color(0xFF2F509D))
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: Text(
                                apiResponse,
                                maxLines: null,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.volume_up_rounded,
                          size: 40.sp,
                          color: Colors.black,
                        ),
                        onPressed: _speak,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: 280.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.video_collection_rounded,
                        color: Color(0xFF2F509D),
                        size: 40.sp,
                      ),
                      onPressed: _pickVideo,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.horizontal_rule_sharp,
                        color: Color(0xFF2F509D),
                        size: 40.sp,
                      ),
                      onPressed: _pickVideoFake,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.video_camera_front_rounded,
                        color: Color(0xFF2F509D),
                        size: 40.sp,
                      ),
                      onPressed: _recordVideo,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 63.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/icons/texto_audio.png',
                      height: 100.h, width: 100.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/icons/home.png',
                          height: 55.h,
                          width: 55.w,
                          color: Color(0xFF2F509D),
                        ),
                      ),
                      Image.asset('assets/icons/perfil.png',
                          height: 55.h, width: 55.w),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
