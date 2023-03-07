import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/home_page.dart';
import 'package:movie_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashService(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 140, 255),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.movie_filter,
                color: Colors.white,
                size: 100,
              ),
              ModifiedText(
                text: 'Movie App',
                color: Colors.white,
                size: 32,
              )
            ]),
      ),
    );
  }

  void splashService(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }
}
