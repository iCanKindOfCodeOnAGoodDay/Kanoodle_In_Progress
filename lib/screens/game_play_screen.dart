import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:multiplayer_game_for_sister/widgets/controls_widgets.dart';
import 'package:multiplayer_game_for_sister/widgets/eleven_rows_playable_slots.dart';
import 'package:provider/provider.dart';

import '../models/shape_color_model.dart';
import '../widgets/new_game_piece_selector_built_of_icons.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage.GamePlayScreen();
  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _shapeColors[
          context.watch<GameplayProvider>().indexOfGamePieceWeAreUsing],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          'images/s-k-background.jpg',
        ))),
        child: Stack(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    // color: Colors.black,
                    // color: Colors.black87,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WidgetGameBoard(),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                WidgetGameControls(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NewGamePieceSelectorWidget(
                      context
                          .watch<GameplayProvider>()
                          .indexOfGamePieceWeAreUsing,
                      true),
                ],
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
