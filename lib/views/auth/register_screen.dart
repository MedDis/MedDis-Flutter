import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/views/auth/widget/password_field.dart';
import 'package:gsc/views/auth/widget/text_input.dart';
import 'package:gsc/views/auth/widget/full_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              const Text(
                "REGISTER",
                style: TextStyle(
                  color: primary,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // Text(
              //   "Identify the disease that you are experiencing",
              //   style: TextStyle(
              //     color: Colors.black.withOpacity(0.4),
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              const Spacer(
                flex: 1,
              ),
              TextInput(
                title: 'Name',
                textHint: 'Enter your Name',
                controller: controller[0],
              ),
              TextInput(
                title: 'Email',
                textHint: 'Enter your Email',
                controller: controller[1],
              ),
              PasswordField(
                controller: controller[2],
                passConfirmation: NoneConfirmation(),
              ),
              PasswordField(
                title: 'Confirm Password',
                controller: controller[3],
                passConfirmation: NoneConfirmation(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              FullButton(
                text: "Register",
                onPressed: () {
                  // context
                  //     .read<AuthProvider>()
                  //     // .signInMailPass('demo@mail.com', 'Demo123');
                  //     .signInMailPass(controller[0].text, controller[1].text);
                },
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
