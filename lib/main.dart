import 'package:flutter/material.dart';
import 'package:movie_app/SplashScreen.dart';

import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromARGB(255, 0, 140, 255)),
          scaffoldBackgroundColor: Color(0xff1a1a1d)),
      home: const SplashScreen(),
    );
  }
}
