import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/models/shape_images_model.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';
import 'screens/game_play_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GameplayProvider()),
    ChangeNotifierProvider(create: (_) => ShapeImagesModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage.GamePlayScreen(),
    );
  }
}
