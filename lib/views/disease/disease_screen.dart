// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gsc/models/tensorflow_model.dart';

class DiseaseScreen extends StatelessWidget {
  const DiseaseScreen({
    Key? key,
    required this.predictData,
  }) : super(key: key);
  // final List predictData;
  // final File file;
  final ClassifierCategory predictData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Disease Screen Detection"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(predictData.label),
            Text("${(predictData.score * 100).toStringAsFixed(2)}%"),
          ],
        ));
  }
}
