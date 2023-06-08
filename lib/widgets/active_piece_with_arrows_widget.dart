import 'package:flutter/material.dart';

import '../models/shape_color_model.dart';
import 'command_icon_buttons.dart';
import 'new_game_piece_selector_built_of_icons.dart';
import 'package:provider/provider.dart';

import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';

class ActivePieceAndArrowsWidgets extends StatelessWidget {
  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   color: Colors.black,
              //   child: Text(
              //     'dotSquash Apps',
              //     style: TextStyle(
              //       color: _shapeColors[context
              //           .watch<GameplayProvider>()
              //           .indexOfGamePieceWeAreUsing],
              //       fontWeight: FontWeight.w200,
              //       // fontSize: 8.0,
              //     ),
              //   ),
              // ),
              WidgetCommandIconButton(
                  icon: Icons.arrow_left,
                  onPressed: () {
                    context.read<GameplayProvider>().moveGamePiece('left');
                  }),
              WidgetCommandIconButton(
                  icon: Icons.keyboard_double_arrow_up,
                  onPressed: () {
                    context.read<GameplayProvider>().moveGamePiece('up');
                  }),
              WidgetCommandIconButton(
                  icon: Icons.arrow_right,
                  onPressed: () {
                    context.read<GameplayProvider>().moveGamePiece('right');
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(
              //   height: 40,
              //   width: 40,
              // ),
              WidgetCommandIconButton(
                  icon: Icons.arrow_drop_down,
                  onPressed: () {
                    context.read<GameplayProvider>().moveGamePiece('down');
                  }),
              Container(
                height: 40,
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
