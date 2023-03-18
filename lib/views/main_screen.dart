import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/main_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, data, _) {
      return Scaffold(
        body: data.body[data.index],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: data.index,
          onDestinationSelected: (value) {
            data.selectDestionation(value);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.book),
              label: "Dictionary",
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.person_crop_circle),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
