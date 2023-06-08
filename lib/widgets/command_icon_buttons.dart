import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

import '../models/shape_color_model.dart';

class WidgetCommandIconButton extends StatelessWidget {
  IconData icon;
  void Function() onPressed;
  WidgetCommandIconButton({required this.icon, required this.onPressed});

  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          // height: 50,
          // width: 50.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            // 'images/whiteFlameBlackBG.jpg',
            'images/emptyBlackSlotWhiteFrameTilted.gif',
          ))),
          child: Opacity(
            opacity: 0.4,
            child: Icon(
              icon,
              size: 40.0,
              color: _shapeColors[
                  context.watch<GameplayProvider>().indexOfGamePieceWeAreUsing],
            ),
          ),
        ),
      ),
    );
  }
}
