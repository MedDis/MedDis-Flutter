import 'package:flutter/material.dart';
import 'package:gsc/models/cards_model.dart';

class HomeProvider with ChangeNotifier {
  List<CardsModel> dataCards = [
    CardsModel(
      image:
          "https://images.unsplash.com/photo-1626697556342-2310dbc55428?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      text: "Ini 3 Cara Lendir Menumpul di Paru-Paru",
    ),
    CardsModel(
      image:
          "https://images.unsplash.com/photo-1447175008436-054170c2e979?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1599&q=80",
      text: "7 Sayuran yang Ampuh Lawan Peradangan dan Cegah Penuan",
    ),
  ];
}
