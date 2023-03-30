import 'package:flutter/material.dart';
import 'package:gsc/models/doctor_model.dart';
import 'package:gsc/models/skin_disease_model.dart';

class DiseaseProvider with ChangeNotifier {
  bool _isHasAdditionalInfo = false;
  bool get isHasAdditionalInfo => _isHasAdditionalInfo;

  List<DoctorModel> listDoctor = [
    DoctorModel(
      name: "Dr. Rayhan Sp.KK",
      specialist: "Dermatologist",
      image:
          "https://pbs.twimg.com/profile_images/759087511356313604/OJ0w7WIS_400x400.jpg",
      hospital: "RS. Fatmawati",
      experience: "4 Years",
    ),
    DoctorModel(
      name: "Dr. Rasyid Sp.KK",
      specialist: "Dermatologist",
      image:
          "https://famoushospital.com/wp-content/uploads/2019/05/doctor2.jpg",
      hospital: "RS. Bunda",
      experience: "1 Year",
    ),
    DoctorModel(
      name: "Dr. Sapta Sp.DK",
      specialist: "Dermatologist",
      image:
          "https://teleradfoundation.org/wp-content/uploads/2022/05/sadiq.jpg",
      hospital: "RS. Fatmawati",
      experience: "2 Years",
    ),
    DoctorModel(
      name: "Dr. Dwi Sp.DK",
      specialist: "Dermatologist",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7_4XHe7wQ3MFPMBORzHGN-Ib7NlLr5JxbMb_hNBRKBr_oUtwFmBAY-Sr9E774v1K8yA&usqp=CAU",
      hospital: "General Practicioner",
      experience: "3 Years",
    ),
  ];

  List<SkinDiseaseModel> listSkinDisease = [
    SkinDiseaseModel(
      name: "Urticaria",
      Descripstion: "Biduran adalah",
      moreInfoLink: "mimkadsa",
      imageList: [
        "https://cdn.shopify.com/s/files/1/1282/4197/articles/urticaria_skin_834x.jpg?v=1651854304",
        ""
      ],
      isCancer: false,
      periliousLevel: "Mild",
    ),
    SkinDiseaseModel(
      name: "Ringworm",
      Descripstion:
          "Ringworm is a fungal infection of the skin that causes a red circular rash. Ringworm can occur in several areas of the body, such as the head, face, hands, feet or groin. Fungi are organisms that can live in various places, including the human body. Some fungi are harmless to humans, but others can be dangerous if they grow and develop in the human body quickly.",
      moreInfoLink: "mimkadsa",
      imageList: [
        "https://cdn.shopify.com/s/files/1/1282/4197/articles/urticaria_skin_834x.jpg?v=1651854304",
        ""
      ],
      isCancer: false,
      periliousLevel: "Mild",
    ),
  ];

  void buttonChangeAdditionalInfo(bool isHasAdditionalInfo) {
    _isHasAdditionalInfo = !isHasAdditionalInfo;
    notifyListeners();
  }
}
