import 'package:flutter/material.dart';
import 'package:gsc/views/dictionary/dictionary_screen.dart';
import 'package:gsc/views/home/home_screen.dart';
import 'package:gsc/views/profile/profile_screen.dart';

class MainProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  List<Widget> body = [
    const HomeScreen(),
    const DictionaryScreen(),
    const ProfileScreen(),
  ];

  void selectDestionation(int value) {
    _index = value;
    notifyListeners();
  }
}
