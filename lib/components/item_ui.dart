import 'package:flutter/material.dart';
import 'package:pr_4/models/item.dart';
import 'package:pr_4/pages/info_page.dart';


class ItemUi extends StatelessWidget {
  const ItemUi({super.key, required this.game, required this.bodyColor, required this.textColor});
  final Item game;
  final Color bodyColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 12.0,
        right: 8.0,
        top: 8.0,
        bottom: 7.0,
      ),

      child: Container(
          height: 350,
          width: 309,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(2, 4),
              ),
            ],
          ),

             child: Stack(
               alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                   Positioned(
                     top: 0,
                     child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero
                                       ),
                                       child: Image(
                      image: NetworkImage(
                          game.image
                      ),
                      width: 309,

                       ),
                     ),
                   ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: bodyColor,
                      borderRadius: BorderRadius.circular(45),
                        boxShadow: const [
                        BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 4),
                        ),
                        ],
                        ),
                  child: Center( child: Text('${game.age}+', style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  ),),
                  ),

                ),

        
              Positioned.fill(
                top: 170,
                  child: Container(
                    height: 180.74,
                    decoration: BoxDecoration(
                      color: bodyColor,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 11.0),
                          child: Text(game.title, style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                        Container(
                            width: 300,
                            height: 0,
                          decoration:
                          BoxDecoration(
                            border: Border(top: BorderSide(width: 1.0,
                              color: textColor,)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0
                          ),
                          child: Text(game.description ,style: TextStyle(
                              fontSize: 12,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${game.price} ₽', style: TextStyle(
                                fontSize: 18,
                                color: textColor,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                              TextButton(onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => InfoPage(game: game),
                                  ),
                                );
                              }, child: Text('Подробнее >>',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  )
              ),
            ],
          ),
        ),
    );
  }
}
