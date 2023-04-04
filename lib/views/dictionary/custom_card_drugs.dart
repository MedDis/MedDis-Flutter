// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gsc/views/drugs_view_after_scan.dart';

class CustomCardDrugs extends StatelessWidget {
  const CustomCardDrugs({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              print("id: $id");
              print("title: $title");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrugsViewAfterScan(
                    id: id,
                    name: title,
                  ),
                ),
              );
            },
            child: SizedBox(
              // color: Colors.white,
              height: size.height * 2 / 32,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
