import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

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

  Opacity buildKey(String path, double height, double width) {
    return Opacity(
      opacity: isTaken == false ? 1 : 1,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage('images/$path'))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isTaken == false) {
      return buildKey(
          // 'emptyBlackSlotWhiteFrameTilted.gif',
          'cyberPunkIconsCombo.gif',
          // 'marblesIconsCombo.gif',
          context.watch<ShapeImagesModel>().heightOfGameBoardIcons,
          context.watch<ShapeImagesModel>().widthOfGameBoardIcons);
    }
    for (int i = 0; i < 12; i++) {
      if (color == _shapeColors[i]) {
        return buildKey(
            context.watch<ShapeImagesModel>().shapePaths[i],
            // _shapePaths[i],
            context.watch<ShapeImagesModel>().heightOfGameBoardIcons,
            context.watch<ShapeImagesModel>().widthOfGameBoardIcons);
      }
    }
    return Icon(
      Icons.circle,
      color: Colors.black,
      size: 40.0,
    );
  }
}
