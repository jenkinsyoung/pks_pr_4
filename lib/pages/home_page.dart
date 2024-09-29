import 'package:flutter/material.dart';
import 'package:pr_4/components/item_list.dart';
import 'package:pr_4/models/item.dart';
import 'package:pr_4/pages/create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _addGame(Item game) {
    setState(() {
      games.add(game);
    });
  }

  void _deleteGame(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
          child:  Text('Удалить игру',
          style: TextStyle(
            color: Color.fromRGBO(76, 23, 0, 1.0),
            fontWeight: FontWeight.w500,
          )),
        ),
        content: const Text('Вы уверены, что хотите удалить эту игру?',
            style: TextStyle(
              color: Color.fromRGBO(76, 23, 0, 1.0),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    games.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Да',
                    style: TextStyle(
                      color: Color.fromRGBO(21, 78, 24, 1.0),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Нет',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
        child: Text('Настольные игры', style: TextStyle(
          color: Color.fromRGBO(76, 23, 0, 1.0),
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
        backgroundColor: const Color.fromRGBO(235, 234, 248, 1.0),
      ),

      body: games.isEmpty ? Container(
        color: const Color.fromRGBO(235, 234, 248, 1.0),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(
                right: 20.0,
                left: 20.0,
            ),
            child: Text('Нет доступных товаров, добавьте хотя бы одну карточку',
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(76, 23, 0, 1.0),
                ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
          :Container(
            color: const Color.fromRGBO(235, 234, 248, 1.0),
            child: ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: games.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ItemList(ind: index),
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          iconSize: 28,

                          icon: const Icon(Icons.delete,
                          color:  Color.fromRGBO(76, 23, 0, 1.0),),
                          onPressed: () => _deleteGame(index),
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 50,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left:5.0,
            top: 8.0,
            ),
            child: FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePage()),
                );
                if (result != null && result is Item) {
                  _addGame(result);
                }
              },
              backgroundColor: const Color.fromRGBO(76, 23, 0, 0.9),
              foregroundColor: const Color.fromRGBO(210, 204, 255, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

