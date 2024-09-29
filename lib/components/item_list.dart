import 'package:flutter/material.dart';
import 'package:pr_4/components/item_ui.dart';
import 'package:pr_4/models/item.dart';
import 'package:pr_4/pages/info_page.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.ind});
  final int ind;
  @override
  Widget build(BuildContext context) {
    if (games[ind].indicator == 1) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InfoPage(game: games[ind]),
            ),
          );
        },
        child: ItemUi(
          game: games[ind],
          bodyColor: const Color.fromRGBO(255, 207, 2, 1.0),
          textColor: const Color.fromRGBO(129, 40, 0, 1.0),
        ),
      );
    } else if (games[ind].indicator == 2) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InfoPage(game: games[ind]),
            ),
          );
        },
        child: ItemUi(
          game: games[ind],
          bodyColor: const Color.fromRGBO(163, 3, 99, 1.0),
          textColor: const Color.fromRGBO(255, 204, 254, 1.0),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InfoPage(game: games[ind]),
            ),
          );
        },
        child: ItemUi(
          game: games[ind],
          bodyColor: const Color.fromRGBO(48, 0, 155, 1.0),
          textColor: const Color.fromRGBO(203, 238, 251, 1.0),
        ),
      );
    }
  }
}
