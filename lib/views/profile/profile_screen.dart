import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      // appBar: AppBar(
      //   title: const Text("Profile"),
      // ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Rayhan Naufal",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: const [
                              Icon(Icons.person_outlined),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Account Info")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: const [
                              Icon(Icons.lock_outlined),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Change Password")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<AuthProvider>().logOut();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: const [
                                Icon(Icons.logout_outlined),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Logout")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 80,
                width: 80,
              ),
            ),
          )
        ],
      ),
    );
  }
}
