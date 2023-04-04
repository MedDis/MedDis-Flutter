import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsc/models/disease_model.dart';
import 'package:gsc/models/drugs_model.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;
  DiseaseModel? diseaseData;

  Future<DiseaseModel> getDiseaseOfHumanBody(String partOfHumanBody) async {
    try {
      debugPrint("jalan di services");
      final snapshot =
          await _db.collection("Disease").doc(partOfHumanBody).get();
      final data = snapshot.data();
      if (data != null) {
        diseaseData = DiseaseModel.fromJson(data);
      } else {
        diseaseData = DiseaseModel(description: "");
      }
      return diseaseData!;
    } catch (e) {
      return DiseaseModel();
    }
  }

  Future<DrugsModel> getDrugsData(String dictionary) async {
    try {
      debugPrint("jalan di services");
      final snapshot = await _db.collection("Dictionary").doc(dictionary).get();
      final data = snapshot.data();
      DrugsModel drugsData = DrugsModel.fromJson(data!);
      return drugsData;
    } catch (e) {
      return DrugsModel();
    }
  }

  // Future<void> postData(
  //     Map<String, Object> partOfHumanBody, String partName) async {
  //   try {
  //     debugPrint("jalan di services");
  //     final snapshot =
  //         await _db.collection("Disease").doc(partName).set(partOfHumanBody);
  //     // print(dataWoi);
  //   } catch (e) {}
  // }
}
