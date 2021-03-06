import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_flutter_app/screens/video_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Video Player Demo'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          VideoItems(),
        ],
      ),
    );
  }
}
