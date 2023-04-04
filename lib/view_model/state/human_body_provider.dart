import 'package:flutter/material.dart';
import 'package:gsc/models/disease_model.dart';
import 'package:gsc/services/firestore_service.dart';
import 'package:gsc/utils/finite_state.dart';

class HumanBodyProvider with ChangeNotifier, FiniteState {
  DiseaseModel? _data;
  DiseaseModel get diseaseData => _data!;
  Map<String, String> partOfBody = {
    "head": "assets/images/human_body/head_human.png",
    "Left_Arm": "assets/images/human_body/left_arm.png",
    "Right_Arm": "assets/images/human_body/right_arm.png",
    "Left_Hand": "assets/images/human_body/left_hand.png",
    "stomach": "assets/images/human_body/stomach.png",
    "hips": "assets/images/human_body/hips.png",
    "Right_Hand": "assets/images/human_body/right_hand.png",
    "Left_Thigh": "assets/images/human_body/left_thigh.png",
    "Right_Thigh": "assets/images/human_body/right_thigh.png",
    "Left_Leg": "assets/images/human_body/left_leg.png",
    "Right_Leg": "assets/images/human_body/right_leg.png",
    "Left_Foot": "assets/images/human_body/left_foot.png",
    "Right_Foot": "assets/images/human_body/right_foot.png",
  };

  Future<void> fetchDataDiseaase(String bodyParts) async {
    setStateAction(StateAction.loading);
    try {
      final result = await FirestoreService().getDiseaseOfHumanBody(bodyParts);
      _data = result;
      setStateAction(StateAction.none);
      notifyListeners();
    } catch (e) {
      setStateAction(StateAction.error);
    }
  }
}
