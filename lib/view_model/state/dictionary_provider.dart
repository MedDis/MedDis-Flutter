import 'package:flutter/material.dart';

class DictionaryProvider with ChangeNotifier {
  final List<Map<String, String>> drugs = [
    {
      "title": "Obat",
      "asset": "assets/images/bottle_drugs.png",
    },
    {
      "title": "Komposisi",
      "asset": "assets/images/bottle_drugs.png",
    },
    {
      "title": "Penyakit",
      "asset": "assets/images/bottle_drugs.png",
    },
    {
      "title": "Singkatan",
      "asset": "assets/images/bottle_drugs.png",
    },
  ];
}
