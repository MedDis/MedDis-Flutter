import 'package:flutter/material.dart';

import 'package:gsc/models/disease_model.dart';

class SpecificDisease extends StatefulWidget {
  const SpecificDisease({
    Key? key,
    required this.diseaseData,
  }) : super(key: key);
  final Data? diseaseData;

  @override
  State<SpecificDisease> createState() => _SpecificDiseaseState();
}

class _SpecificDiseaseState extends State<SpecificDisease> {
  final String dataSymptom =
      "The main symptom of migraine is severe headache on one side of the head. The pain is generally a throbbing pain of moderate to severe intensity that is more pronounced when moving, seeing bright lights, or hearing noise.\nMigraines can be triggered by increased levels of the hormone estrogen, or emotional factors, such as stress or anxiety. The use of certain medications, such as birth control pills, can also trigger migraines.";
  String symptomParagraph = "";
  String descriptionParagraph = "";
  String treatmentParagraph = "";
  late List<ListTreatment> dataTreatment = [];

  @override
  void initState() {
    descriptionParagraph =
        widget.diseaseData!.description!.replaceAll("\n", "\n\n");
    symptomParagraph = widget.diseaseData!.symptom!.replaceAll("\n", "\n\n");
    treatmentParagraph = widget.diseaseData!.treatment!.treatmentDescription!
        .replaceAll("\n", "\n\n");
    widget.diseaseData!.treatment!.listTreatment!.map(
      (e) {
        if (e.descriptionListTreatment != null) {
          String dataDescriptionList =
              e.descriptionListTreatment!.replaceAll("\n", "\n\n");
          ListTreatment data = ListTreatment(
              treatmentName: e.treatmentName,
              descriptionListTreatment: dataDescriptionList);
          dataTreatment.add(data);
        }
      },
    ).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(widget.diseaseData!.nameDisease!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.diseaseData!.image!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Description: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Card(
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    descriptionParagraph,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const Text(
                "Symptom: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Card(
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    symptomParagraph,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const Text(
                "Treatment: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Card(
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        treatmentParagraph,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: List.generate(
                          widget.diseaseData!.treatment!.listTreatment!.length,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}. ${widget.diseaseData!.treatment!.listTreatment![index].treatmentName}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(dataTreatment[index]
                                      .descriptionListTreatment ??
                                  ""),
                              Visibility(
                                visible: index != 1,
                                child: const SizedBox(
                                  height: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
