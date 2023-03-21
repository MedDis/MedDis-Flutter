import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:gsc/views/auth/register_screen.dart';
import 'package:gsc/views/auth/widget/password_field.dart';
import 'package:gsc/views/auth/widget/text_input.dart';
import 'package:gsc/views/auth/widget/full_button.dart';
import 'package:gsc/views/auth/widget/google_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<TextEditingController> controller = [
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
                flex: 3,
              ),
              const Text(
                "Medical Discovery",
                style: TextStyle(
                  color: primary,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Identify the disease that you are experiencing",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              TextInput(
                title: 'Email',
                textHint: 'Enter your Email',
                controller: controller[0],
              ),
              PasswordField(
                controller: controller[1],
                passConfirmation: NoneConfirmation(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Consumer<AuthProvider>(builder: (context, data, _) {
                if (data.actionState == StateAction.loading) {
                  return const Padding(
                      padding: EdgeInsets.only(top: 29, bottom: 29),
                      child: CircularProgressIndicator());
                } else {
                  return FullButton(
                    text: "Login",
                    onPressed: () {
                      context
                          .read<AuthProvider>()
                          // .signInMailPass('demo@mail.com', 'Demo123');
                          .signInMailPass(
                              controller[0].text, controller[1].text);
                    },
                  );
                }
              }),
              const Text("OR"),
              const GoogleButton(
                buttonName: 'Login',
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
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
