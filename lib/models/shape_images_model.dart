import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';

/// still using the non-provider method of accessing the shape images
/// so once the object which is created
/// holds a value which is not changing
/// because it is preset using the images
/// and even tho the lists are changing here
/// once created, they wont change
///
/// so the solution
/// is to listen to the content of the lists using the provider
/// instead of creating a class object and accesing it's properties
/// use the provider
/// becuase, we are manaing state

class ShapeImagesModel with ChangeNotifier {
  double heightOfGameBoardIcons = 40;
  double widthOfGameBoardIcons = 40;

  bool currentlyDisplayingLargeIcons = false;

  double rotationForGameBoard = 0;

  void requestLargeIcons() {
    heightOfGameBoardIcons = 70;
    widthOfGameBoardIcons = 70;
    rotationForGameBoard = 0;
    print('toggleIconsSize just changed the icons size');

    currentlyDisplayingLargeIcons = true;
    notifyListeners();
  }

  void requestSmallIcons() {
    rotationForGameBoard = -45;
    heightOfGameBoardIcons = 40;
    widthOfGameBoardIcons = 40;
    print('toggleIconsSize just changed the icons size');

    currentlyDisplayingLargeIcons = false;
    notifyListeners();
  }

  bool wantsCyberIcons = true;

  void toggleIconsStyle() {
    print('called toggleIcons, wantsCyberIcons = $wantsCyberIcons');
    print('${shapePaths[0]}');

    if (wantsCyberIcons == true) {
      shapePaths = [];
      shapePaths = [
        'icon-1.png',
        'icon-2.png',
        'icon-3.png',
        'icon-4.png',
        'icon-5.png',
        'icon-6.png',
        'icon-7.png',
        'icon-8.png',
        'icon-9.png',
        'icon-10.png',
        'icon-11.png',
        'icon-12.png',
        'icon-13.png',
      ];
      wantsCyberIcons = false;
    } else {
      shapePaths = [];

      shapePaths = [
        'newIcon-22blue.png',
        'newIcon-beachBall.png',
        'newIcon-black-neon-green.png',
        'newIcon-white.png',
        'newIcon-yellow.png',
        'newIcon-green.png',
        'newIcon-neon-green.png',
        'newIcon-orange.png',
        'newIcon-gray.png',
        'newIcon-orange2.png',
        'newIcon-pink2.png',
        'newIcon-purple2.png',
        'newIcon-red2.png',
      ];
      wantsCyberIcons = true;
    }
    print('${shapePaths[0]}');
    print(wantsCyberIcons);
    notifyListeners();
  }

  List<String> shapePaths = [
    // 'icon-1.png',
    // 'icon-2.png',
    // 'icon-3.png',
    // 'icon-4.png',
    // 'icon-5.png',
    // 'icon-6.png',
    // 'icon-7.png',
    // 'icon-8.png',
    // 'icon-9.png',
    // 'icon-10.png',
    // 'icon-11.png',
    // 'icon-12.png',
    // 'icon-13.png',
    'newIcon-22blue.png',
    'newIcon-beachBall.png',
    'newIcon-black-neon-green.png', 'newIcon-white.png',
    'newIcon-yellow.png',
    'newIcon-green.png',
    'newIcon-neon-green.png',
    'newIcon-orange.png',
    'newIcon-gray.png',
    'newIcon-orange2.png',
    'newIcon-pink2.png',
    'newIcon-purple2.png',
    'newIcon-red2.png',
  ];
}
