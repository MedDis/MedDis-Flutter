import 'package:flutter/material.dart';

class DictionaryProvider with ChangeNotifier {
  final List<Map<String, String>> drugs = [
    {
      "title": "Drug",
      "asset": "assets/images/drug.png",
    },
    {
      "title": "Composition",
      "asset": "assets/images/drug_composition.png",
    },
    {
      "title": "Penyakit",
      "asset": "assets/images/disease.png",
    },
    {
      "title": "Singkatan",
      "asset": "assets/images/abbreviation.png",
    },
  ];
}
