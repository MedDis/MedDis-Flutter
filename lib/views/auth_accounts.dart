import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:gsc/views/main_screen.dart';
import 'package:provider/provider.dart';

import 'auth/login_screen.dart';

class AuthAccount extends StatelessWidget {
  const AuthAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final dataAccount = context.watch<AuthProvider>();
          dataAccount.getCurentUser();
          // if (dataAccount.userData!.displayName == null ||
          //     dataAccount.userData!.photoURL == null) {
          //   // context.read<AuthProvider>().logOut();
          //   return const Text('Gagal');
          // }

          return const MainScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ada yang error!!'),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
