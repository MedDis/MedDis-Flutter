// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/human_body_provider.dart';
import 'package:provider/provider.dart';

class PartOfHumanBody extends StatefulWidget {
  const PartOfHumanBody({
    Key? key,
    required this.partName,
  }) : super(key: key);

  final String partName;

  @override
  State<PartOfHumanBody> createState() => _PartOfHumanBodyState();
}

class _PartOfHumanBodyState extends State<PartOfHumanBody> {
  String? header;

  @override
  void initState() {
    header = widget.partName.split("_").join(" ");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final partOfBody = Provider.of<HumanBodyProvider>(context).partOfBody;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(header!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                partOfBody[widget.partName]!,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
