// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuCards extends StatelessWidget {
  const MenuCards({
    Key? key,
    required this.title,
    required this.images,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String images;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 18),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: size.height * 1 / 8,
            width: size.width * 8 / 9,
            // decoration: BoxDecoration(
            //   image:
            //       DecorationImage(image: NetworkImage(images), fit: BoxFit.cover),
            // ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF51A3E5),
                  Color(0xFF60AEE5),
                  Color(0xFF80CEFE),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 1 / 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Image.asset(images),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
