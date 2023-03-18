import 'package:flutter/material.dart';
import 'package:gsc/views/dictionary/dictionary_view.dart';
import 'package:gsc/views/home/home_view.dart';
import 'package:gsc/views/profile/profile_view.dart';

class MainProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  List<Widget> body = [
    const HomeView(),
    const DictionaryView(),
    const ProfileView(),
  ];

  void selectDestionation(int value) {
    _index = value;
    notifyListeners();
  }
}
