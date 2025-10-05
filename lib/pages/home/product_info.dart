import 'package:flutter/material.dart';

import '../../entities/game.dart';

class ProductInfo extends StatelessWidget {
  final Game _game;

  const ProductInfo(this._game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              _game.image,
              width: 200,
              height: 110,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_game.title),
              Text(
                "${_game.price} TND",
                textScaleFactor: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
