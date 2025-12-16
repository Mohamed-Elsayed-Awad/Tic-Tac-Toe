import 'package:flutter/material.dart';
import 'package:tic_tac_toe_xo/views/game_screen.dart';
import 'package:tic_tac_toe_xo/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "Game Screen": (context) => GameScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
