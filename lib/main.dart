import 'package:bmi/screens/input_page.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
