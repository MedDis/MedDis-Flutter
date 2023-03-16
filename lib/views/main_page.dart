import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:gsc/views/widget/auth/password_field.dart';
import 'package:gsc/views/widget/auth/text_input.dart';
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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<AuthProvider>().logOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
