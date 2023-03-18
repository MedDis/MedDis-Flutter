import 'package:flutter/material.dart';

import 'package:gsc/models/cards_model.dart';

class ListNewCards extends StatelessWidget {
  const ListNewCards({
    Key? key,
    required this.dataCards,
  }) : super(key: key);
  final List<CardsModel> dataCards;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          dataCards.length,
          (index) => Row(
            children: [
              Visibility(
                visible: index == 0,
                child: SizedBox(
                  width: size.width * 1 / 18,
                ),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: size.height * 3 / 16,
                  width: size.width * 8 / 9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        dataCards[index].image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.white.withOpacity(0.6),
                        height: size.height * 1 / 16,
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 1 / 30,
                            vertical: size.width * 1 / 60,
                          ),
                          child: Text(
                            dataCards[index].text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 1 / 72,
              ),
              Visibility(
                visible: index == 2 - 1,
                child: SizedBox(
                  width: size.width * 1 / 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
