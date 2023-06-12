import 'package:flutter/material.dart';

import 'package:multiplayer_game_for_sister/models/shape_color_model.dart';
import 'package:multiplayer_game_for_sister/models/shape_pattern_map.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

import '../models/shape_images_model.dart';

List<List<List<String>>> _maps = ShapeMap().maps;

List<Color> _shapeColors = ShapeColorModel().shapeColors;
// List<String> _shapePaths = ShapeImagesModel().shapePaths;

class NewGamePieceSelectorWidget extends StatelessWidget {
  final int colorIndex;
  final bool isThePreviewPieceOnTheBottomLeftOfScreen;

  NewGamePieceSelectorWidget(
    this.colorIndex,
    this.isThePreviewPieceOnTheBottomLeftOfScreen,
  );

  /// return an asset image instead
  Container rowChild(
    String xValueOnEachRow,
    Color colour,
    String imagePath,
  ) {
    if (xValueOnEachRow == 'x') {
      return Container(
        height: isThePreviewPieceOnTheBottomLeftOfScreen == false ? 15.0 : 40,
        width: isThePreviewPieceOnTheBottomLeftOfScreen == false ? 15.0 : 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('images/$imagePath'),
          ),
        ),
      );
    } else {
      /// blank
      return isThePreviewPieceOnTheBottomLeftOfScreen == false
          ? Container(
              child: Icon(
                Icons.circle_rounded,
                color: Colors.black12,
                size: 15,
              ),
            )
          : Container(
              height: 40,
              width: 40,
            );
    }
  }

  Container builtShape(color, path) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// currently always using index 0 for the map because that's the orientation that the gameplay currently supports
            Row(
              children: [
                rowChild(
                    _maps[colorIndex][0][0][0], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][0][1], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][0][2], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][0][3], _shapeColors[colorIndex], path),
              ],
            ),
            Row(
              children: [
                rowChild(
                    _maps[colorIndex][0][1][0], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][1][1], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][1][2], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][1][3], _shapeColors[colorIndex], path),
              ],
            ),

            Row(
              children: [
                rowChild(
                    _maps[colorIndex][0][2][0], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][2][1], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][2][2], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][2][3], _shapeColors[colorIndex], path),
              ],
            ),
            Row(
              children: [
                rowChild(
                    _maps[colorIndex][0][3][0], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][3][1], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][3][2], _shapeColors[colorIndex], path),
                rowChild(
                    _maps[colorIndex][0][3][3], _shapeColors[colorIndex], path),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: GestureDetector(
            onTap: () {
              for (int i = 0; i <= 11; i++) {
                if (colorIndex == i) {
                  context.read<GameplayProvider>().setActiveGamePiece(i);
                  context
                      .read<GameplayProvider>()
                      .updateBackgroundColorIndex3ToCurrentGamePiece();
                }
              }
            },
            child: builtShape(_shapeColors[colorIndex],
                context.watch<ShapeImagesModel>().shapePaths[colorIndex])));
  }
}
