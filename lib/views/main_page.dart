import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:provider/provider.dart';

class MainPages extends StatelessWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePages'),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              context.read<AuthProvider>().logOut();
            },
            child: const Text('Logout')),
      ),
    );
  }
}
