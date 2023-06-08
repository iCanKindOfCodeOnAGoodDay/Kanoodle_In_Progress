import 'package:flutter/material.dart';

import '../models/shape_color_model.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

class LevelWidget extends StatelessWidget {
  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.monetization_on,
          size: 30.0,
          color: Colors.black,
        ),
        Column(
          children: [
            Text('Level 1'),
          ],
        ),
      ],
    );
  }
}
