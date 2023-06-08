import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';

import '../models/shape_color_model.dart';
import '../models/shape_images_model.dart';

class WidgetPlayableSlot extends StatelessWidget {
  List<Color> _shapeColors = ShapeColorModel().shapeColors;
  List<String> _shapePaths = ShapeImagesModel().shapePaths;

  /// is taken
  /// color
  bool isTaken = false;
  Color color = Colors.black12;
  double turns = 0;

  WidgetPlayableSlot({required this.color, required this.isTaken});

  Opacity buildKey(String path) {
    return Opacity(
      opacity: isTaken == false ? 0.12 : 1,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage('images/$path'))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isTaken == false) {
      return buildKey('emptyBlackSlotWhiteFrameTilted.gif');
    }
    for (int i = 0; i < 12; i++) {
      if (color == _shapeColors[i]) {
        return buildKey(_shapePaths[i]);
      }
    }
    return Icon(
      Icons.circle,
      color: Colors.black,
      size: 40.0,
    );
  }
}
