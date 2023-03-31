import 'package:flutter/material.dart';
import 'package:gsc/models/doctor_model.dart';
import 'package:gsc/models/skin_disease_model.dart';
import 'package:gsc/utils/finite_state.dart';

class DiseaseProvider with ChangeNotifier, FiniteState {
  bool _isHasAdditionalInfo = false;
  bool get isHasAdditionalInfo => _isHasAdditionalInfo;

  List<DoctorModel> listDoctor = [
    DoctorModel(
      name: "Dr. Rayhan Sp.KK",
      specialist: "Dermatologist",
      image:
          "https://pbs.twimg.com/profile_images/759087511356313604/OJ0w7WIS_400x400.jpg",
      hospital: "RSU Bunda Margonda",
      latitudeLongitude: [-6.364940067121678, 106.83484805587089],
      experience: "4 Years",
    ),
    DoctorModel(
      name: "Dr. Rasyid Sp.KK",
      specialist: "Dermatologist",
      image:
          "https://famoushospital.com/wp-content/uploads/2019/05/doctor2.jpg",
      latitudeLongitude: [-6.372723619652904, 106.8296194806852],
      hospital: "RS. Universitas Indonesia",
      experience: "1 Year",
    ),
    DoctorModel(
      name: "Dr. Sapta Sp.DK",
      specialist: "Dermatologist",
      image:
          "https://teleradfoundation.org/wp-content/uploads/2022/05/sadiq.jpg",
      latitudeLongitude: [-6.394156412420279, 106.82453855279957],
      hospital: "RS Mitra Keluarga",
      experience: "2 Years",
    ),
    DoctorModel(
      name: "Dr. Dwi Sp.DK",
      specialist: "General Practicioner",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7_4XHe7wQ3MFPMBORzHGN-Ib7NlLr5JxbMb_hNBRKBr_oUtwFmBAY-Sr9E774v1K8yA&usqp=CAU",
      latitudeLongitude: [-6.370069878608769, 106.81394761527515],
      hospital: "RS Graha Permata Ibu",
      experience: "3 Years",
    ),
  ];

  List<SkinDiseaseModel> listSkinDisease = [
    SkinDiseaseModel(
      name: "Urticaria",
      description:
          "Hives is a skin reaction characterized by reddish bumps and itching. Hives can appear on any area of the skin, including the face, neck, ears, and entire body. In general, hives are mild and resolve on their own after a few hours or after taking medication. However, in some cases, hives can last for several weeks and recur. This condition can be referred to as chronic hives.",
      reason:
          "Hives or urticaria is characterized by the appearance of reddish bumps or rashes accompanied by itching. Based on its type, hives can be divided into acute hives and chronic hives. Acute hives lasts less than 6 weeks, while chronic hives lasts for more than 6 weeks. Hives is an allergic reaction to a foreign object or substance, which causes the immune system to secrete histamine. Histamine is what causes the signs and symptoms of hives.In addition to allergic reactions, hives can be tricked by several factors, such as stress, reactions to hot temperatures, or certain diseases, such as thyroid disease or cancer.",
      treatment:
          "Mild hives will usually resolve without treatment. However, recurrent hives need to be treated with prescribed medications, such as antihistamines or corticosteroids. Avoiding heat, stress, drugs or food is an effective way to prevent hives. These foods or drugs can be avoided after being confirmed by the doctor as the cause of hives in the patient.",
      imageList: [
        "https://cdn.shopify.com/s/files/1/1282/4197/articles/urticaria_skin_834x.jpg?v=1651854304",
      ],
      isCancer: false,
      periliousLevel: "Mild",
    ),
    SkinDiseaseModel(
      name: "Ringworm",
      description:
          "Ringworm is a fungal infection of the skin that causes a red circular rash. Ringworm can occur in several areas of the body, such as the head, face, hands, feet or groin. Fungi are organisms that can live in various places, including the human body. Some fungi are harmless to humans, but others can be dangerous if they grow and develop in the human body quickly.",
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

  Future<SkinDiseaseModel> validateDisease(String predictData) async {
    setStateAction(StateAction.loading);
    for (var element in listSkinDisease) {
      if (element.name == predictData) {
        setStateAction(StateAction.none);
        return SkinDiseaseModel(
            name: element.name,
            description: element.description,
            treatment: element.treatment,
            reason: element.reason,
            isCancer: element.isCancer,
            imageList: element.imageList,
            periliousLevel: element.periliousLevel);
      }
      return SkinDiseaseModel();
    }
    return SkinDiseaseModel();
  }
}
