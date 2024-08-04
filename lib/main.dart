import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tic_tak_toe_game/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
