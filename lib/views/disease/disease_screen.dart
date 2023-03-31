// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gsc/models/skin_disease_model.dart';

import 'package:gsc/utils/colors.dart';
import 'package:gsc/view_model/state/disease_provider.dart';
import 'package:gsc/views/disease/list_disease_card.dart';
import 'package:gsc/views/disease/perilious_level.dart';
import 'package:gsc/views/disease/recomendation_doctor_card.dart';
import 'package:provider/provider.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({
    Key? key,
    required this.path,
    required this.predictData,
  }) : super(key: key);
  // final List predictData;
  // final File file;
  final String path;
  final SkinDiseaseModel predictData;

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
        // dataSkinDisease = Provider.of<DiseaseProvider>(context, listen: false)
        //     .validateDisease("Urticaria");
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
                        widget.predictData.name!,
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
                      Text(
                        widget.predictData.description ?? "",
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
                        child: additionalInfo(widget.predictData),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              PeriliousLevel(
                preliousLevel: widget.predictData.periliousLevel!,
              ),
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
                return Column(
                  children: List.generate(
                    3,
                    (index) => RecomendationDoctorCard(
                      dataDoctor: data.listDoctor[index],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget additionalInfo(SkinDiseaseModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Reason :",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          textAlign: TextAlign.justify,
          data.reason!,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Treatment :",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          textAlign: TextAlign.justify,
          data.treatment!,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
