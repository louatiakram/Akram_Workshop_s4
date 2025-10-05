import 'package:flutter/material.dart';

import '../../entities/game.dart';
import 'my_game_info.dart';

class MyGames extends StatefulWidget {
  const MyGames();

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  final List<Game> _games = [];
  String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, in pretium orci vestibulum eget.";

  @override
  void initState() {
    _games.add(Game("assets/images/dmc5.jpg", "Devil May Cry", _description, 200, 3000));
    _games.add(Game("assets/images/re8.jpg", "Resident Evil VIII", _description, 200, 3000));
    _games.add(Game("assets/images/nfs.jpg", "Need For Speed Heat", _description, 100, 1500));
    _games.add(Game("assets/images/rdr2.jpg", "RDR 2", _description, 150, 2500));
    _games.add(Game("assets/images/fifa.jpg", "FIFA 22", _description, 100, 5000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma bibliothèque"),
      ),
      body: GridView.builder(
        itemCount: _games.length,
        itemBuilder: (BuildContext context, int index) {
          return MyGameInfo(_games[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 120
        ),
      ),
    );
  }
}
