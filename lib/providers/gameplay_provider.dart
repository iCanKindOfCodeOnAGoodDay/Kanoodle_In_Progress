import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/models/game_board_model.dart';
import 'package:multiplayer_game_for_sister/models/shape_color_model.dart';
import 'package:multiplayer_game_for_sister/models/shape_locations.dart';
import 'package:multiplayer_game_for_sister/models/shape_pattern_map.dart';

import '../widgets/playable_slot_widget.dart';

class GameplayProvider with ChangeNotifier {
  ///todo  choose which piece to control with the icon buttons

  List<List<List<String>>> maps = ShapeMap().maps;

  List<List<WidgetPlayableSlot>> playableSlotsOnEachRow =
      GameBoardModel().playableSlotsOnEachRow;

  List<List<int>> locations = ShapeLocations().locations;

  final List<Color> _shapeColors = ShapeColorModel().shapeColors;

  bool _wantsMarbleIcons = true;
  bool get wantsMarbleIcons => _wantsMarbleIcons;

  void toggleTypesOfIconsBetweenMarblesAndCyberPunk() {
    !_wantsMarbleIcons;
    notifyListeners();
  }

  int indexOfGamePieceWeAreUsing = 0;

  double turns = 0;
  void changeRotation() {
    turns += 1.0 / 8.0;
    notifyListeners();
  }

  /// implement start over

  void resetAllLocationsOnMap() {
    /// reset game board by setting all gamepiece origins to 0, 1
    for (var i = 0; i < 12; i++) {
      /// iterate over all 12 game pieces
      locations[i].first = 0;
      locations[i].last = -1;
      print('resetting game piece $i');
    }
    notifyListeners();
  }

  void physicallyClearTheGameBoard() {
    for (var i = 0; i < 11; i++) {
      /// do something 12 times
      for (var j = 0; j < 5; j++) {
        /// do something 5 times
        playableSlotsOnEachRow[i][j] =
            WidgetPlayableSlot(color: Colors.black12, isTaken: false);
      }
    }
    notifyListeners();
  }

  /// tapping a game piece sets active piece and
  void setActiveGamePiece(indexMatch) {
    indexOfGamePieceWeAreUsing = indexMatch;
    print(
        'we just set the active game piece to ${_shapeColors[indexOfGamePieceWeAreUsing]}');
    notifyListeners();
  }

  /// for testing purposes, let's just simplify this function
  void moveGamePiece(String direction) {
    findClosestOrigin();
  }

  int requiredMatches = 0;
  int foundMatches = 0;

  void determineHowManyColoredDotsBelongToAGamePiece() {
    requiredMatches = 0;
    for (int z = 0; z < 4; z++) {
      for (int n = 0; n < 4; n++) {
        if (maps[indexOfGamePieceWeAreUsing][0][z][n] == 'x') {
          requiredMatches++;
        }
      }
    }
    print('required matches = $requiredMatches');
    print('found matches = $foundMatches');
  }

  void findClosestOrigin() {
    int x = 0;
    int y = 0;
    var i = 0;
    while (i < 55) {
      if (i % 5 == 0) {
        ///starting point
        if (i < 5) {
          y = 0;
        } else {
          y++;
          x = 0;
        }

        /// then we arrived at 5, 10, 15, 20, all the way up to 55
      }
      bool foundAMatch = returnTheNextBestOrigin(x: x, y: y);
      if (foundAMatch == true) {
        /// todo program the stopping condition
        print("we found the closest origin to place a game piece, at $x, $y");
        print("repainting the shape onto the gameboard");
        print("breaking the search loop early @ step i = $i ");
        locations[indexOfGamePieceWeAreUsing].first = x;
        locations[indexOfGamePieceWeAreUsing].last = y;
        paintShapeOntoBoard();
        foundMatches = 0;
        break;
        //exit the loop if the first multiple is found
      } else {
        foundMatches = 0;
        print('i == $i');
      }
      i++;
    }
  }

  bool returnTheNextBestOrigin({required int x, required int y}) {
    y = y + 3;

    /// top left
    foundMatches = 0;
    determineHowManyColoredDotsBelongToAGamePiece();
    print('checking a single starting point at the top left: $x, $y,');
    for (int z = 0; z < 4; z++) {
      for (int c = 0; c < 4; c++) {
        if (maps[indexOfGamePieceWeAreUsing].first[z][c] == 'x') {
          if (y - z < 11 && x + c < 5) {
            if (playableSlotsOnEachRow[y - z][x + c].isTaken == false) {
              print('needed slot exists and is open');
              foundMatches++;
              print('incrementing found matches');
              print('found matches = $foundMatches');
              if (foundMatches == requiredMatches) {
                // we are searching for free space before destroying
                // we should destroy, then search
                // and if there is not an opening, then reset the location
                // to the previous spot
                searchAndDestroy();

                /// return the point
                return true;
              }
            } else {
              print('this point is taken');
              foundMatches = 0;
              return false;
            }
          }
        }
      }
    }
    return false;
  }

  void paintShapeOntoBoard() {
    int y = locations[indexOfGamePieceWeAreUsing].last + 3;

    /// we are starting from the top left?
    int x = locations[indexOfGamePieceWeAreUsing].first;
    print('paint starting top left is: $x, $y');
    // destroyPaintedIcons();

    for (int z = 0; z < 4; z++) {
      for (int c = 0; c < 4; c++) {
        if (maps[indexOfGamePieceWeAreUsing].first[z][c] == 'x') {
          int paintedY = y - z;
          int paintedX = x + c;
          print('painting an icon at x = $paintedX  and y = $paintedY');
          // int errorX = x + c;

          playableSlotsOnEachRow[y - z][x + c] = WidgetPlayableSlot(
              color: _shapeColors[indexOfGamePieceWeAreUsing], isTaken: true);
          notifyListeners();
        }
      }
    }
  }

  void searchAndDestroy() {
    print('calling to set icons to default for current shape');
    for (int i = 0; i < 11; i++) {
      /// iterate through each of the 11 rows
      for (int j = 0; j < 5; j++) {
        /// iterate through each of the 5 x coordinates
        if (playableSlotsOnEachRow[i][j].color ==
            _shapeColors[indexOfGamePieceWeAreUsing]) {
          print(
              'we found a match of the old shape pattern so it should be destroyed');
          playableSlotsOnEachRow[i][j] =
              WidgetPlayableSlot(color: Colors.black12, isTaken: false);
          foundMatches++;
          if (foundMatches == requiredMatches) {
            print(
                'we have destroyed all of the icons from the previous paint of this shape we can break the searchAndDestroyLoop');
            // we can break the loop
            foundMatches = 0;
            break;
          }
        }
      }

      ///
    }
  }
}
