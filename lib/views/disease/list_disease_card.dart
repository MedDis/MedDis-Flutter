import 'package:flutter/material.dart';

import 'package:gsc/models/skin_disease_model.dart';

class ListDiseaseCard extends StatelessWidget {
  const ListDiseaseCard({
    Key? key,
    required this.skinDiseaseModel,
  }) : super(key: key);

  final SkinDiseaseModel skinDiseaseModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          skinDiseaseModel.imageList!.length,
          (index) => Row(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: size.height * 2 / 16,
                  width: size.width * 3.5 / 8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        skinDiseaseModel.imageList![index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 1 / 72,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
