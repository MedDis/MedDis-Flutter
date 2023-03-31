import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/view_model/controller/api_controller.dart';

import '../../models/drugs_model.dart';

class DrugsProvider with ChangeNotifier {
  StateAction drugsState = StateAction.none;
  String drugsMessage = "";
  Drugs? data;

  void fetchDrugssData(int id) async {
    drugsState = StateAction.loading;
    notifyListeners();

    try {
      final result = await ApiHandler.getDrugsProductByID(id);
      // print(result);
      // print("===== Disini");

      data = result;
      drugsState = StateAction.hasData;
      notifyListeners();
    } on SocketException catch (e) {
      print(e.toString());
      drugsMessage = e.toString();
      drugsState = StateAction.error;
      notifyListeners();
    }
  }
}
