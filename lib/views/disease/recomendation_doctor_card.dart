// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gsc/models/doctor_model.dart';
import 'package:gsc/utils/colors.dart';

import '../doctor/doctor_view.dart';

class RecomendationDoctorCard extends StatelessWidget {
  const RecomendationDoctorCard({
    Key? key,
    required this.dataDoctor,
  }) : super(key: key);
  final DoctorModel dataDoctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DoctorView(
          dataDoctor: dataDoctor,
        ),
      )),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: primary,
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(dataDoctor.image)),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataDoctor.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Text(
                    dataDoctor.specialist,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    dataDoctor.hospital,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
