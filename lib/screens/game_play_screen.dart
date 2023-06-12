import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/models/shape_images_model.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:multiplayer_game_for_sister/widgets/controls_widgets.dart';
import 'package:multiplayer_game_for_sister/widgets/eleven_rows_playable_slots.dart';
import 'package:provider/provider.dart';

import '../models/shape_color_model.dart';
import '../widgets/new_game_piece_selector_built_of_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage.GamePlayScreen();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> _shapeColors = ShapeColorModel().shapeColors;

  late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      ///todo - update the ui
      print('reached the top');
      context.read<ShapeImagesModel>().requestLargeIcons();
    } else if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      ///todo - update the ui
      print('reached the botto,m');
      context.read<ShapeImagesModel>().requestSmallIcons();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _shapeColors[
          context.watch<GameplayProvider>().indexOfGamePieceWeAreUsing],
      body: Container(
        // color: context.watch<GameplayProvider>().availableBackgroundColors[
        //     context.watch<GameplayProvider>().backgroundColorIndex],

        decoration: context.watch<GameplayProvider>().backgroundColorIndex > 2
            ? BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.fitHeight,
                image:
                    context.watch<GameplayProvider>().backgroundColorIndex == 3
                        ? AssetImage(
                            'images/s-k-background.jpg',
                            // 'images/5.31.80SGRIDAPPFACE copy.jpg',
                          )
                        : AssetImage(
                            // 'images/s-k-background.jpg',
                            'images/5.31.80SGRIDAPPFACE copy.jpg',
                          ),
              ))
            : BoxDecoration(
                color:
                    context.watch<GameplayProvider>().availableBackgroundColors[
                        context.watch<GameplayProvider>().backgroundColorIndex],
              ),
        child: Stack(
          children: [
            ListView(
              controller: _controller,
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
                    Stack(
                      children: [
                        WidgetGameControls(),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, top: 300),
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
