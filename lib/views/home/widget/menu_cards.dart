// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gsc/utils/colors.dart';
import 'package:gsc/views/auth/widget/full_button.dart';

class MenuCards extends StatelessWidget {
  const MenuCards({
    Key? key,
    this.isPrimaryColors = true,
    required this.title,
    required this.images,
    this.onTap,
  }) : super(key: key);
  final bool isPrimaryColors;
  final String title;
  final String images;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: isPrimaryColors ? primary : Colors.white,
      child: SizedBox(
        height: size.height * 0.25,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: isPrimaryColors ? Colors.white : primary),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
              child: Image.asset(
                images,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FullButton(
                  secondaryColor: isPrimaryColors,
                  text: "Check",
                  onPressed: onTap,
                  height: 38,
                  width: 80,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
