// import 'package:flutter/material.dart';
// import 'package:multiplayer_game_for_sister/providers/gameplay_provider.dart';
// import 'package:provider/provider.dart';
//
// class WidgetGamePieces extends StatelessWidget {
//   String path;
//   double height = 1;
//   double width = 1;
//   double rotation = 0;
//   WidgetGamePieces(this.path,
//       {required this.height, required this.width, required this.rotation});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           if (path == 'darkBlue.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(0);
//           } else if (path == 'darkGreen.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(1);
//           } else if (path == 'darkPink.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(2);
//           } else if (path == 'gray.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(3);
//           } else if (path == 'lightBlue.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(4);
//           } else if (path == 'lightGreen.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(5);
//           } else if (path == 'lightPink.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(6);
//           } else if (path == 'orange.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(7);
//           } else if (path == 'purple.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(8);
//           } else if (path == 'red.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(9);
//           } else if (path == 'white.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(10);
//           } else if (path == 'yellow.png') {
//             context.read<GameplayProvider>().setActiveGamePiece(11);
//           }
//
//           ///todo pass in image path into a function that selects the current game piece from the provider
//         },
//         child: Container(
//           // transform: Matrix4.rotationZ(rotation),
//           height: (10 * height),
//           width: (10 * width),
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('images/$path'), fit: BoxFit.contain)),
//         ),
//       ),
//     );
//   }
// }
