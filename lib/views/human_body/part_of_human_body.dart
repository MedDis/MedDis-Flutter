// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/utils/finite_state.dart';
import 'package:gsc/view_model/state/human_body_provider.dart';
import 'package:gsc/views/human_body/specific_disease.dart';
import 'package:provider/provider.dart';

class PartOfHumanBody extends StatefulWidget {
  const PartOfHumanBody({
    Key? key,
    required this.partName,
  }) : super(key: key);

  final String partName;

  @override
  State<PartOfHumanBody> createState() => _PartOfHumanBodyState();
}

class _PartOfHumanBodyState extends State<PartOfHumanBody> {
  String? partNameData;
  String? header;

  @override
  void initState() {
    partNameData = widget.partName;
    if (widget.partName == "Right_Thigh" ||
        widget.partName == "Left_Thigh" ||
        widget.partName == "Left_Leg" ||
        widget.partName == "Right_Leg") {
      partNameData = "thigh";
    }
    header = widget.partName.split("_").join(" ");
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<HumanBodyProvider>(context, listen: false)
            .fetchDataDiseaase(partNameData!);
      },
    );
    print(widget.partName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final partOfBody = Provider.of<HumanBodyProvider>(context).partOfBody;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(header!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  partOfBody[widget.partName]!,
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const VerticalDivider(
                      color: primary,
                      thickness: 2,
                    ),
                    Consumer<HumanBodyProvider>(builder: (context, value, _) {
                      if (value.actionState == StateAction.loading) {
                        return const CircularProgressIndicator();
                      } else {
                        if (value.diseaseData != null) {
                          return Expanded(
                            child: Text(
                              value.diseaseData.description ?? "",
                              textAlign: TextAlign.justify,
                            ),
                          );
                        } else {
                          return const Text("error");
                        }
                      }
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Posible Diseases: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<HumanBodyProvider>(builder: (context, value, _) {
                if (value.actionState == StateAction.loading) {
                  return const CircularProgressIndicator();
                } else {
                  if (value.diseaseData.description != "") {
                    final data = value.diseaseData.data!;
                    return Column(
                      children: List.generate(
                        data.length,
                        (index) => InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SpecificDisease(
                              diseaseData: data[index],
                            ),
                          )),
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            surfaceTintColor: Colors.white,
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              width: double.maxFinite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].nameDisease!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data[index].description!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text("Empty Data");
                  }
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
