class DiseaseModel {
  String? description;
  List<Data>? data;

  DiseaseModel({this.description, this.data});

  DiseaseModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? image;
  String? nameDisease;
  String? description;
  String? symptom;
  Treatment? treatment;
  Prevention? prevention;

  Data(
      {this.image,
      this.nameDisease,
      this.description,
      this.symptom,
      this.treatment,
      this.prevention});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    nameDisease = json['nameDisease'];
    description = json['description'];
    symptom = json['symptom'];
    treatment = json['treatment'] != null
        ? Treatment.fromJson(json['treatment'])
        : null;
    prevention = json['prevention'] != null
        ? Prevention.fromJson(json['prevention'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['nameDisease'] = nameDisease;
    data['description'] = description;
    data['symptom'] = symptom;
    if (treatment != null) {
      data['treatment'] = treatment!.toJson();
    }
    if (prevention != null) {
      data['prevention'] = prevention!.toJson();
    }
    return data;
  }
}

class Treatment {
  String? treatmentDescription;
  List<ListTreatment>? listTreatment;

  Treatment({this.treatmentDescription, this.listTreatment});

  Treatment.fromJson(Map<String, dynamic> json) {
    treatmentDescription = json['treatmentDescription'];
    if (json['listTreatment'] != null) {
      listTreatment = <ListTreatment>[];
      json['listTreatment'].forEach((v) {
        listTreatment!.add(ListTreatment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['treatmentDescription'] = treatmentDescription;
    if (listTreatment != null) {
      data['listTreatment'] = listTreatment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListTreatment {
  String? treatmentName;
  String? descriptionListTreatment;

  ListTreatment({this.treatmentName, this.descriptionListTreatment});

  ListTreatment.fromJson(Map<String, dynamic> json) {
    treatmentName = json['treatmentName'];
    descriptionListTreatment = json['descriptionListTreatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['treatmentName'] = treatmentName;
    data['descriptionListTreatment'] = descriptionListTreatment;
    return data;
  }
}

class Prevention {
  String? preventionDescription;
  List<ListPrevention>? listPrevention;

  Prevention({this.preventionDescription, this.listPrevention});

  Prevention.fromJson(Map<String, dynamic> json) {
    preventionDescription = json['preventionDescription'];
    if (json['listPrevention'] != null) {
      listPrevention = <ListPrevention>[];
      json['listPrevention'].forEach((v) {
        listPrevention!.add(ListPrevention.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['preventionDescription'] = preventionDescription;
    if (listPrevention != null) {
      data['listPrevention'] = listPrevention!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListPrevention {
  String? preventionName;
  String? preventionListDescription;

  ListPrevention({this.preventionName, this.preventionListDescription});

  ListPrevention.fromJson(Map<String, dynamic> json) {
    preventionName = json['preventionName'];
    preventionListDescription = json['preventionListDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['preventionName'] = preventionName;
    data['preventionListDescription'] = preventionListDescription;
    return data;
  }
}
