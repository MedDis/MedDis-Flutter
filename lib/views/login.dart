import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:gsc/views/widget/auth/password_field.dart';
import 'package:gsc/views/widget/auth/text_input.dart';
import 'package:gsc/views/widget/full_button.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            TextInput(
              title: 'Email',
              controller: controller[0],
            ),
            PasswordField(
              controller: controller[1],
              passConfirmation: NoneConfirmation(),
            ),
            FullButton(
              onPressed: () {
                context
                    .read<AuthProvider>()
                    // .signInMailPass('demo@mail.com', 'Demo123');
                    .signInMailPass(controller[0].text, controller[1].text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
