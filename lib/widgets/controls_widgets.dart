import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/models/shape_color_model.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:multiplayer_game_for_sister/widgets/command_icon_buttons.dart';
import 'package:multiplayer_game_for_sister/widgets/command_text_buttons.dart';
import 'package:multiplayer_game_for_sister/widgets/new_game_piece_selector_built_of_icons.dart';
import 'package:provider/provider.dart';
import 'active_piece_with_arrows_widget.dart';
import 'title_bar_widget.dart';
import 'all_selectable_pieces_display_widget.dart';

class WidgetGameControls extends StatelessWidget {
  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:
      // _shapeColors[
      //     context.watch<GameplayProvider>().indexOfGamePieceWeAreUsing],
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // title
            TitleBarWidget(),
            // pieces selector
            AllSelectablePiecesDisplayWidget(),
            //controls
            // SizedBox(
            //   height: 30.0,
            // ),
            ActivePieceAndArrowsWidgets(),
          ],
        ),
      ),
    );
  }
}
