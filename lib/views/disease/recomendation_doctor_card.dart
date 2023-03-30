// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gsc/models/doctor_model.dart';

class RecomendationDoctorCard extends StatelessWidget {
  const RecomendationDoctorCard({
    Key? key,
    required this.doctorData,
  }) : super(key: key);
  final List<DoctorModel> doctorData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        doctorData.length <= 3 ? doctorData.length : 3,
        (index) => Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(doctorData[index].image)),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorData[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text(doctorData[index].specialist),
                    Text(doctorData[index].hospital)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
