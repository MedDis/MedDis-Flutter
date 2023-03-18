import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Empty Cards"),
    );
  }
}
