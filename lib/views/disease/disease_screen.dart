// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:gsc/models/tensorflow_model.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/view_model/state/disease_provider.dart';
import 'package:gsc/views/disease/list_disease_card.dart';
import 'package:gsc/views/disease/perilious_level.dart';
import 'package:gsc/views/disease/recomendation_doctor_card.dart';
import 'package:provider/provider.dart';

enum DiseaseLevel { mild, moderate, severe }

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({
    Key? key,
    required this.path,
    required this.predictData,
  }) : super(key: key);
  // final List predictData;
  // final File file;
  final String path;
  final ClassifierCategory predictData;

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<DiseaseProvider>(context, listen: false)
            .buttonChangeAdditionalInfo(true);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = Provider.of<DiseaseProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          title: const Text("Disease Screen Detection"),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        // height: size.height *,
                        child: Image.asset(
                          widget.path,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.predictData.label,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: primary),
                        ),
                        const Text("Not a Skin Cancer"),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description :",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "Biduran atau urtikaria adalah reaksi kulit yang menyebabkan timbulnya bilur berwarna merah atau putih. Bilur yang timbul ini juga disertai dengan rasa gatal. Awalnya, bilur ini muncul hanya di satu bagian tubuh, tapi lama-kelamaan bilur ini akhirnya menyebar. Salah satu penyebab umumnya adalah alergi, tetapi ukuran dan bentuk bilur bisa berbeda-beda.",
                          textAlign: TextAlign.justify,
                          // style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListDiseaseCard(),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Visibility(
                          visible: !prov.isHasAdditionalInfo,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Provider.of<DiseaseProvider>(context,
                                          listen: false)
                                      .buttonChangeAdditionalInfo(
                                          prov.isHasAdditionalInfo);
                                },
                                child: const Text("Learn More")),
                          ),
                        ),
                        Visibility(
                          visible: prov.isHasAdditionalInfo,
                          child: additionalInfo(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const PeriliousLevel(),
                const SizedBox(
                  height: 4,
                ),
                // Card(
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   child: Container(
                //     padding: const EdgeInsets.all(20),
                //     color: Colors.white,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const [
                //         Text("Penyebab :"),
                //         Text(
                //           "Munculnya bilur pada kulit ini dipicu oleh tingginya kadar histamin yang dilepaskan ke kulit.Tubuh menyimpan histamin di dalam sel. Ketika sistem kekebalan mengenali ancaman, ia akan melepaskan histamin dan bahan kimia lainnya. Rangkaian bahan kimia ini bisa melindungi kamu dari penyakit serius akibat infeksi atau gigitan serangga. Namun, terkadang, sistem kekebalan melepaskan histamin ketika tidak ada ancaman nyata. Hal ini terjadi ketika,",
                //           textAlign: TextAlign.justify,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recomendation Doctor: ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Consumer<DiseaseProvider>(builder: (context, data, _) {
                  if (data.listDoctor.isEmpty) {
                    return const Text("No Doctor Recomendation");
                  }
                  return RecomendationDoctorCard(
                    doctorData: data.listDoctor,
                  );
                })
              ],
            ),
          ),
        ));
  }

  Widget additionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 20,
        ),
        Text(
          "Reason :",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          textAlign: TextAlign.justify,
          "Ringworm is caused by a fungal infection of the skin. This fungus can be transmitted through direct contact with the patient or indirect contact with contaminated objects or soil. Hot and humid air, sharing personal items, and wearing tight clothing can make a person more susceptible to ringworm. Ringworm is characterized by the appearance of a reddish scaly rash on the surface of the skin. This skin rash may spread. However, the symptoms of ringworm may vary from person to person, depending on the location of the ringworm.",
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Treatment :",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          textAlign: TextAlign.justify,
          "Ringworm can be treated with ringworm ointment or antifungals, such as clotrimazole or miconazole. If ringworm does not improve or heal after 2 weeks of treatment, consult a doctor immediately. Your doctor may prescribe a stronger medication. Ringworm can be prevented by maintaining good hygiene. In addition, avoid sharing personal items with others, and shower, wash your hair, and change your clothes every day or immediately after sweating.",
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
