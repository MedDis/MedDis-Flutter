import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gsc/view_model/state/human_body_provider.dart';
import 'package:gsc/views/human_body/part_of_human_body.dart';
import 'package:provider/provider.dart';

class HumanBodyScreen extends StatefulWidget {
  const HumanBodyScreen({super.key});

  @override
  State<HumanBodyScreen> createState() => _HumanBodyScreenState();
}

class _HumanBodyScreenState extends State<HumanBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text("Human Body"),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: openContainer("Head"),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer("Left_Arm"),
                    openContainer("Right_Arm")
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 75,
                      child: openContainer("Left_Hand"),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: openContainer("Stomach"),
                        ),
                        SizedBox(
                          height: 25,
                          child: openContainer("Hips"),
                        ),
                      ],
                    ),
                    openContainer("Right_Hand"),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer("Left_Thigh"),
                    openContainer("Right_Thigh")
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer("Left_Leg"),
                    openContainer("Right_Leg"),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer("Left_Foot"),
                    openContainer("Right_Foot"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget openContainer(String partName) {
    final partOfBody = Provider.of<HumanBodyProvider>(context).partOfBody;

    return OpenContainer(
      closedShape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedBuilder: (context, action) {
        return Image.asset(partOfBody[partName]!);
      },
      openBuilder: (context, action) => PartOfHumanBody(
        partName: partName,
      ),
    );
  }
}
