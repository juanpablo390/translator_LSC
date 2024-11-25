import 'package:flutter/material.dart';
import 'package:translate_lsc/componentes/links_drawer.dart';
import 'package:translate_lsc/sections/home_page.dart';

class TextTranslatorPage extends StatefulWidget {
  const TextTranslatorPage({super.key});

  @override
  _TextTranslatorPageState createState() => _TextTranslatorPageState();
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
    'años': 7,
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
  bool _isFastAnimation =
      true; // Flag para controlar la velocidad de la animación
  double _animationOpacity = 0.0; // Controla la opacidad de la animación

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);

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
        }
      }
    });
  }

  void _updateWords(String text) {
    String normalizedText =
        text.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');

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
      final durationPerFrame =
          _isFastAnimation ? 100 : 100; // Duración rápida o normal
      _animationController.duration = Duration(
        milliseconds: totalFrames * durationPerFrame,
      );

      _frameAnimation =
          Tween<double>(begin: 1, end: totalFrames.toDouble()).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.linear,
        ),
      );
    }
  }

  void _startAnimation() {
    if (_words.isNotEmpty) {
      setState(() {
        _currentWordIndex = 0;
        _isFastAnimation = true; // Usar animación rápida al inicio
        _isAnimating = true;
        _animationFinished = false;
        _animationOpacity = 0.0; // Comenzar invisible
      });
      _setAnimationForCurrentWord();
      _animationController.forward();
    }
  }

  void _repeatAnimation() {
    if (_words.isNotEmpty) {
      setState(() {
        _currentWordIndex = 0;
        _isFastAnimation = false; // Usar animación normal en la repetición
        _isAnimating = true;
        _animationFinished = false;
        _animationOpacity = 0.0; // Comenzar invisible
      });
      _setAnimationForCurrentWord();
      _animationController.forward();
      // Aumentar la opacidad a 1 después de un pequeño retraso
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          _animationOpacity = 1.0; // Hacer visible la animación
        });
      });
    }
  }

  void _resetForNewTranslation() {
    setState(() {
      _words.clear();
      _unavailableWords.clear();
      _textController.clear();
      _animationFinished = false;
      _isFastAnimation = true; // Resetear para animación rápida
      _animationOpacity = 0.0; // Reiniciar opacidad a invisible
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                Image.asset('assets/icons/logo.png', height: 180),
              ],
            ),
            const SizedBox(height: 50),
            if (_isAnimating || _animationFinished)
              Column(
                children: [
                  if (_animationOpacity == 0.0)
                    CircularProgressIndicator(
                      color: const Color(0xFF2F509D),
                    ),
                  AnimatedOpacity(
                    opacity: _animationOpacity,
                    duration: const Duration(
                        milliseconds:
                            300), // Duración de la transición de opacidad
                    child: AnimatedBuilder(
                      animation: _frameAnimation,
                      builder: (context, child) {
                        return _words.isNotEmpty
                            ? Image.asset(
                                'assets/signs/${_words[_currentWordIndex]}/frame_${_frameAnimation.value.round()}.jpg',
                                width: 350,
                                height: 400,
                              )
                            : Container();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_unavailableWords.isNotEmpty)
                    Text(
                      'Palabras no disponibles: ${_unavailableWords.join(', ')}',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  if (_animationFinished)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _repeatAnimation,
                          child: const Text('Ver otra vez'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _resetForNewTranslation,
                          child: const Text('Nueva traducción'),
                        ),
                      ],
                    ),
                ],
              )
            else
              Container(
                width: 320,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _textController,
                        onChanged: _updateWords,
                        decoration: const InputDecoration(
                          hintText: "Escribe o habla aquí",
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(Icons.check,
                            size: 40, color: Colors.black),
                        onPressed: _startAnimation,
                      ),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('assets/icons/audio_texto.png', height: 100),
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
                        height: 55,
                        color: const Color(0xFF2F509D),
                      ),
                    ),
                    Image.asset('assets/icons/perfil.png', height: 55),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
