import 'package:flutter/material.dart';

import 'package:tic_tak_toe_game/screens/playpage.dart';

import 'gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const PlayButton()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientText(
          "Tic Tak Toe",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 40,
              fontWeight: FontWeight.bold),
          gradient: LinearGradient(colors: [
            Colors.greenAccent,
            Colors.pinkAccent,
            Colors.orangeAccent,
            Colors.cyanAccent,
            Colors.orangeAccent,
            Colors.pinkAccent,
            Colors.greenAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        GradientText(
          "Game",
          style: TextStyle(
              decoration: TextDecoration.none, fontWeight: FontWeight.bold),
          gradient: LinearGradient(colors: [
            Colors.greenAccent,
            Colors.pinkAccent,
            Colors.orangeAccent,
            Colors.cyanAccent,
            Colors.orangeAccent,
            Colors.pinkAccent,
            Colors.greenAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      ],
    );
  }
}
