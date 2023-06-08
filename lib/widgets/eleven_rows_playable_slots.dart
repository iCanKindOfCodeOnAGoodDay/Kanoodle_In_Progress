import 'package:flutter/material.dart';
import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
import 'package:provider/provider.dart';

class WidgetGameBoard extends StatelessWidget {
  const WidgetGameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              context.watch<GameplayProvider>().playableSlotsOnEachRow[10],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[9],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[8],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[7],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[6],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[5],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[4],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[3],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[2],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[1],
        ),
        Row(
          /// this is the 11th row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context.watch<GameplayProvider>().playableSlotsOnEachRow[0],
        ),
      ],
    );
  }
}
