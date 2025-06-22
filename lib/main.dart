import 'package:akari/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SplashScreen()),
    );
  }
}
