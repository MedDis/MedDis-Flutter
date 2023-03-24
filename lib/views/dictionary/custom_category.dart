// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    Key? key,
    required this.title,
    required this.asset,
  }) : super(key: key);
  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 3 / 40,
          width: size.height * 3 / 40,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(asset),
                ),
              ),
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
