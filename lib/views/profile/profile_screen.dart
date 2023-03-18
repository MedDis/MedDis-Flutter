import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ElevatedButton(
        onPressed: () {
          context.read<AuthProvider>().logOut();
        },
        child: const Text('Logout'),
      ),
    );
  }
}
