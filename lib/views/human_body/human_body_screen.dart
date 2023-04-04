import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';
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
        backgroundColor: primary,
        foregroundColor: Colors.white,
        title: const Text(
          "Human Body",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Press the body part you want to detect the disease",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: openContainer(
                    partName: "head",
                    border: const BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32))),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer(
                        partName: "Left_Arm",
                        border: const BorderRadius.only(
                            topLeft: Radius.circular(64))),
                    openContainer(
                        partName: "Right_Arm",
                        border: const BorderRadius.only(
                            topRight: Radius.circular(64)))
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
                      child: openContainer(
                          partName: "Left_Hand",
                          border: const BorderRadius.only(
                              topLeft: Radius.circular(64),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(64))),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: openContainer(
                              partName: "stomach",
                              border: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                        ),
                        SizedBox(
                          height: 25,
                          child: openContainer(
                              partName: "hips",
                              border: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16))),
                        ),
                      ],
                    ),
                    openContainer(
                        partName: "Right_Hand",
                        border: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            topRight: Radius.circular(64),
                            bottomLeft: Radius.circular(64))),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer(
                        partName: "Left_Thigh",
                        border: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                        )),
                    openContainer(
                        partName: "Right_Thigh",
                        border: const BorderRadius.only(
                          topRight: Radius.circular(16),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer(
                        partName: "Left_Leg", border: BorderRadius.zero),
                    openContainer(
                        partName: "Right_Leg", border: BorderRadius.zero),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    openContainer(
                        partName: "Left_Foot",
                        border: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(32))),
                    openContainer(
                        partName: "Right_Foot",
                        border: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(32))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget openContainer({required String partName, BorderRadius? border}) {
    final partOfBody = Provider.of<HumanBodyProvider>(context).partOfBody;

    return OpenContainer(
      // closedShape:
      //     const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      closedShape:
          RoundedRectangleBorder(borderRadius: border ?? BorderRadius.zero),
      // closedElevation: 0,
      // closedColor: primary,
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
