import 'package:flutter/material.dart';

enum StateAction {
  none,
  hasData,
  noData,
  loading,
  error,
}

mixin FiniteState on ChangeNotifier {
  StateAction actionState = StateAction.none;

  void setStateAction(StateAction newState) {
    actionState = newState;
    notifyListeners();
  }
}
