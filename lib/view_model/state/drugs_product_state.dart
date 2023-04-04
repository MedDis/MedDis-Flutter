import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/services/api_controller.dart';

import '../../models/drugs_model.dart';

class DrugsProductProvider with ChangeNotifier {
  StateAction drugsProductState = StateAction.none;
  String drugsProductMessage = "";
  List<DrugsMini> data = [];

  void fetchDrugsProductsData() async {
    drugsProductState = StateAction.loading;
    notifyListeners();

    try {
      final result = await ApiHandler.getAllDrugsProduct(1);
      // print(result);
      // print("===== Disini");

      data.addAll(result);
      drugsProductState = StateAction.hasData;
      notifyListeners();
    } on SocketException catch (e) {
      print(e.toString());
      drugsProductMessage = e.toString();
      drugsProductState = StateAction.error;
      notifyListeners();
    }
  }
}
