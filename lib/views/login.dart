import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            context
                .read<AuthProvider>()
                .signInMailPass('demo@mail.com', 'Demo123');
          },
          child: const Text('Test'),
        ),
      ),
    );
  }
}
