import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

import 'command_text_buttons.dart';
import 'new_game_piece_selector_built_of_icons.dart';

class AllSelectablePiecesDisplayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            /// there are 12 game pieces
            Row(
              children: [
                NewGamePieceSelectorWidget(0, false),
                NewGamePieceSelectorWidget(1, false),
                NewGamePieceSelectorWidget(2, false),
                NewGamePieceSelectorWidget(3, false),
                WidgetCommandButtonWithText(
                    text: 'start over',
                    buttonColor: Colors.black,
                    onPressed: () {
                      context.read<GameplayProvider>().resetAllLocationsOnMap();
                      context
                          .read<GameplayProvider>()
                          .physicallyClearTheGameBoard();
                    }),
              ],
            ),
            Row(
              children: [
                NewGamePieceSelectorWidget(4, false),
                NewGamePieceSelectorWidget(5, false),
                NewGamePieceSelectorWidget(6, false),
                NewGamePieceSelectorWidget(7, false),
                WidgetCommandButtonWithText(
                    text: 'hint', buttonColor: Colors.black, onPressed: () {}),
              ],
            ),
            Row(
              children: [
                NewGamePieceSelectorWidget(8, false),
                NewGamePieceSelectorWidget(9, false),
                NewGamePieceSelectorWidget(10, false),
                NewGamePieceSelectorWidget(11, false),
                WidgetCommandButtonWithText(
                    text: 'rotate',
                    buttonColor: Colors.black,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
