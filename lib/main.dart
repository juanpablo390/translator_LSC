import 'package:flutter/material.dart';
import 'package:translate_lsc/sections/text_translator_page.dart';

void main() {
  runApp(const TraductorComSenhasApp());
}

class TraductorComSenhasApp extends StatelessWidget {
  const TraductorComSenhasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextTranslatorPage(),
    );
  }
}

//----------------------------------------------------------
