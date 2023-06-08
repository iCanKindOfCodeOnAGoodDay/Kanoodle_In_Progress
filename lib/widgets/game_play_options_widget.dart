import 'package:flutter/material.dart';

class GamePlayOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.person,
            size: 30.0,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Free play'),
              Text('Play friends'),
              Text('Account'),
            ],
          ),
        ],
      ),
    );
  }
}
