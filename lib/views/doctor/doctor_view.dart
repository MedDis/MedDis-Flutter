// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:gsc/models/doctor_model.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/views/auth/widget/full_button.dart';
import 'package:gsc/views/doctor/doctor_map.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({
    Key? key,
    required this.dataDoctor,
  }) : super(key: key);

  final DoctorModel dataDoctor;

  @override
  Widget build(BuildContext context) {
    final topBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: 280,
            child: Column(
              children: [
                SizedBox(
                  height: topBar,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(dataDoctor.image),
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                            ),
                            Text(
                              dataDoctor.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              dataDoctor.specialist,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Patientis",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          dataDoctor.patients.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Experience",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          dataDoctor.experience,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            // color: primary,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Card(
              margin: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Location",
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DoctorMap(
                            dataDoctor: dataDoctor,
                          ),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/${dataDoctor.latitudeLongitude[1]},${dataDoctor.latitudeLongitude[0]},16.91,0/300x200?access_token=pk.eyJ1IjoiLWh2LSIsImEiOiJja2hwcGt1MzgwMHg1MnJvNTA5OWVoYXk0In0.Az6kzTuvhoGHnCsIL74trQ"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 200,
                        width: double.maxFinite,
                        child: const Center(
                          child: Icon(Icons.location_on_sharp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                color: primary,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Address",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    Text(
                      "Jl. Margonda Raya No.28, Pondok Cina, Kecamatan Beji, Kota Depok, Jawa Barat 16424",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: FullButton(
              secondaryColor: true,
              marginBottom: 0,
              marginTop: 20,
              onPressed: () {},
              height: 40,
              shape: 16,
              // width: dou,
              text: "BOOK APPOINTMENT",
            ),
          )
        ],
      ),
    );
  }
}
