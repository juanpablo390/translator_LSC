import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate_lsc/componentes/links_drawer.dart';
import 'package:translate_lsc/sections/home_page.dart';

class TextTranslatorPage extends StatefulWidget {
  const TextTranslatorPage({super.key});

  @override
  State<TextTranslatorPage> createState() => _TextTranslatorPageState();
}

class _TextTranslatorPageState extends State<TextTranslatorPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _frameAnimation;
  final Map<String, int> _wordFrames = {
    'hola': 13,
    'como estas': 14,
    'buenos dias': 19,
    'buenas tardes': 22,
    'buenas noches': 19,
    'mi nombre es': 13,
    'mucho gusto': 13,
    'bien': 10,
    'mal': 13,
    'si': 12,
    'no': 17,
    'adios': 16,
    'bienvenido': 18,
    'soy': 14,
    'yo': 14,
    'tu': 14,
    'mama': 18,
    'papa': 12,
    'hijo': 17,
    'hija': 14,
    'hermana': 16,
    'hermano': 14,
    'amigo': 16,
    'casa': 17,
    'perdon': 17,
    'permiso': 15,
    'ayuda': 15,
    'te ayudo': 13,
    'cuidate': 18,
    'comer': 14,
    'repetir': 16,
    'jugar': 15,
    'por favor': 18,
    'gracias': 13,
    'años': 13,
    'estudiante': 5,
    'pamplona': 7,
    'tambien': 6,
    'tengo': 3,
    'universidad': 3,
    'valentina': 39,
    'sharith': 38,
    '22': 3,
  };

  List<String> _words = [];
  List<String> _unavailableWords = [];
  int _currentWordIndex = 0;
  bool _isAnimating = false;
  bool _animationFinished = false;
  double _animationOpacity = 0.0; // Controla la opacidad de la animación

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    bool hasRepeated = false; // Nueva variable para controlar la repetición

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();

        if (_currentWordIndex < _words.length - 1) {
          setState(() {
            _currentWordIndex++;
          });
          _setAnimationForCurrentWord();
          _animationController.forward();
        } else {
          setState(() {
            _animationFinished = true; // Marcar que la animación terminó
            _isAnimating = false; // Detener la animación
            _animationOpacity = 1.0; // Hacer visible la animación
          });
          if (!hasRepeated) {
            hasRepeated = true; // Marcar que ya se ejecutó
            _startAnimation();
          }
        }
      }
    });
  }

  void _updateWords(String text) {
    // Eliminar las tildes sin usar NormalizerForm
    String normalizedText = text
        .toLowerCase()
        .replaceAll(RegExp(r'[áàäâ]'), 'a')
        .replaceAll(RegExp(r'[éèëê]'), 'e')
        .replaceAll(RegExp(r'[íìïî]'), 'i')
        .replaceAll(RegExp(r'[óòöô]'), 'o')
        .replaceAll(RegExp(r'[úùüû]'), 'u');

    // Eliminar puntuaciones y mantener solo letras y espacios
    normalizedText = normalizedText.replaceAll(RegExp(r'[^\w\sñÑ]'), '');

    List<String> detectedWords = [];
    List<String> unavailableWords = [];
    int index = 0;

    while (index < normalizedText.length) {
      bool matchFound = false;

      for (String key in _wordFrames.keys.toList()
        ..sort((a, b) => b.length.compareTo(a.length))) {
        if (normalizedText.substring(index).startsWith(key)) {
          detectedWords.add(key);
          index += key.length + 1;
          matchFound = true;
          break;
        }
      }

      if (!matchFound) {
        int nextSpace = normalizedText.indexOf(' ', index);
        if (nextSpace == -1) nextSpace = normalizedText.length;
        unavailableWords.add(normalizedText.substring(index, nextSpace));
        index = nextSpace + 1;
      }
    }

    setState(() {
      _words = detectedWords;
      _unavailableWords = unavailableWords.where((w) => w.isNotEmpty).toList();
      _animationFinished = false;
      _animationOpacity = 0.0; // Reiniciar opacidad a invisible
    });
  }

  void _setAnimationForCurrentWord() {
    if (_currentWordIndex < _words.length) {
      final word = _words[_currentWordIndex];
      final totalFrames = _wordFrames[word]!;

      // Precargar todas las imágenes de frames para el word actual
      for (int i = 1; i <= totalFrames; i++) {
        precacheImage(AssetImage('assets/signs/$word/frame_$i.jpg'), context);
      }

      // Ajustar la duración de la animación con base en el número de frames
      _animationController.duration = Duration(milliseconds: totalFrames * 100);

      // Configurar la animación del frame
      _frameAnimation = Tween<double>(begin: 1, end: totalFrames.toDouble())
          .animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ));
    }
  }

  void _startAnimation() {
    if (_words.isNotEmpty) {
      setState(() {
        _currentWordIndex = 0;
        _isAnimating = true;
      });

      // Iniciar la animación configurada para la primera palabra
      _setAnimationForCurrentWord();
      _animationController.forward();
    }
  }

  void _resetForNewTranslation() {
    setState(() {
      _words.clear();
      _unavailableWords.clear();
      _textController.clear();
      _animationFinished = false;
      _animationOpacity = 0.0; // Reiniciar opacidad a invisible
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
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
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Contenido principal
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
                    Image.asset('assets/icons/logo.png',
                        height: 130.h, width: 130.w),
                  ],
                ),
                //
                if (_isAnimating || _animationFinished)
                  Column(
                    children: [
                      SizedBox(height: 40.h),
                      if (_animationOpacity == 0.0)
                        CircularProgressIndicator(
                          color: Color(0xFF2F509D),
                        ),
                      AnimatedOpacity(
                        opacity: _animationOpacity,
                        duration: Duration(milliseconds: 0),
                        child: AnimatedBuilder(
                          animation: _frameAnimation,
                          builder: (context, child) {
                            return _words.isNotEmpty
                                ? Image.asset(
                                    'assets/signs/${_words[_currentWordIndex]}/frame_${_frameAnimation.value.round()}.jpg',
                                    width: 450.w,
                                    height: 250.h,
                                  )
                                : Container();
                          },
                        ),
                      ),
                      if (_unavailableWords.isNotEmpty && _unavailableWords.every((w) => w != ' ') )
                        Text(
                          'Palabras no disponibles: ${_unavailableWords.join(', ')}',
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                        ),
                      if (!_isAnimating)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Botón "Reproducir"
                            SizedBox(
                              width: 155.w,
                              height: 35.h,
                              child: ElevatedButton.icon(
                                onPressed: _startAnimation,
                                icon: Icon(Icons.play_arrow, color: Colors.white),
                                label: Text(
                                  'Reproducir',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color(0xFFF49F38), // Color del texto
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 2, // Ligera sombra
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w), // Espacio entre botones
                            // Botón "Nueva traducción"
                            SizedBox(
                              width: 155.w,
                              height: 35.h,
                              child: ElevatedButton.icon(
                              onPressed: _resetForNewTranslation,
                              icon: Icon(Icons.refresh, color: Colors.white),
                              label: Text(
                                'Nueva traducción',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                   fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xFF2F509D) ,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 2, // Ligera sombra
                              ),
                            )),
                          ],
                        ),
                    ],
                  )
                else
                  Column(
                    children: [
                      SizedBox(height: 80.h),
                      Container(
                        width: 280.w,
                        height: 250.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: TextField(
                                cursorColor: Colors.black,
                                focusNode: _focusNode,
                                controller: _textController,
                                onChanged: _updateWords,
                                decoration: InputDecoration(
                                    hintText: "Escribe o habla aquí",
                                    border: InputBorder.none),
                                maxLines: null,
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.black),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(Icons.check,
                                    size: 40.sp, color: Colors.black),
                                onPressed: _startAnimation,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Image.asset('assets/icons/audio_texto.png',
                height: 100.h, width: 100.w),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            child: Row(
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
          )
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
