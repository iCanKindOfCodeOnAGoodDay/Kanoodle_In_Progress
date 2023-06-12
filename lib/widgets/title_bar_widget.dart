import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/models/shape_images_model.dart';
import 'package:provider/provider.dart';

import '../models/shape_color_model.dart';
import '../providers/gameplay_provider.dart';
import 'game_play_options_widget.dart';
import 'level_info_widget.dart';

class TitleBarWidget extends StatelessWidget {
  List<Color> _shapeColors = ShapeColorModel().shapeColors;
  ShapeImagesModel _shapeImagesModel = ShapeImagesModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,

      color: _shapeColors[
          context.watch<GameplayProvider>().indexOfGamePieceWeAreUsing],
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0, top: 2.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'images/toodoodile-logo.jpg'))),
                          // color: Colors.black,
                          // child: Text(
                          //   'TaDoodle',
                          //   style: TextStyle(
                          //       color: _shapeColors[context
                          //           .watch<GameplayProvider>()
                          //           .indexOfGamePieceWeAreUsing],
                          //       fontWeight: FontWeight.w800),
                          // ),
                        ),
                        // Container(
                        //   // color: Colors.black,
                        //   child: Text(
                        //     'dotSquash Apps',
                        //     style: TextStyle(
                        //         color: _shapeColors[context
                        //             .watch<GameplayProvider>()
                        //             .indexOfGamePieceWeAreUsing],
                        //         fontWeight: FontWeight.w200),
                        //   ),
                        // ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:
                                      AssetImage('images/noodleDoodleDo.png'))),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    LevelWidget(),
                    GestureDetector(
                        onTap: () {
                          context
                              .read<GameplayProvider>()
                              .updateBackgroundColorTheme();
                        },
                        child: Icon(Icons.color_lens_outlined)),
                  ],
                ),
                GamePlayOptionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
