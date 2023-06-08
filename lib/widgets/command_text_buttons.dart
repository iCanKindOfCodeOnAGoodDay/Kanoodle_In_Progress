import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

import '../models/shape_color_model.dart';

class WidgetCommandButtonWithText extends StatelessWidget {
  String text;
  Color buttonColor;
  void Function() onPressed;
  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  WidgetCommandButtonWithText(
      {required this.text, required this.buttonColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/emptyBlackSlotWhiteFrameTilted.gif')),
            borderRadius: BorderRadius.circular(40)),
        width: 80.0,
        height: 40.0,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: _shapeColors[context
                    .watch<GameplayProvider>()
                    .indexOfGamePieceWeAreUsing],
                fontSize: 10),
          ),
        ),
      ),
    );
  }
}
