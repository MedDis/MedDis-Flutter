class DrugsMini {
  int? id;
  String? name;

  DrugsMini(this.id, this.name);

  factory DrugsMini.fromJson(Map<String, dynamic> e) =>
      DrugsMini(e['id'], e['name']);

  static fromListJson(List<Map<String, dynamic>> e) {
    List<DrugsMini> bufffer = [];
    for (Map<String, dynamic> i in e) {
      bufffer.add(DrugsMini(i['id'], i['name']));
    }
  }
}

class Drugs {
  String categories;
  String name;
  String desc;
  String indication;
  String composition;
  String dosage;
  String useRule;
  String noRegist;
  String effect;
  String manufacture;

  Drugs(
      this.categories,
      this.name,
      this.desc,
      this.indication,
      this.composition,
      this.dosage,
      this.useRule,
      this.noRegist,
      this.effect,
      this.manufacture);

  factory Drugs.fromJson(Map<String, dynamic> e) => Drugs(
      e['Categories'],
      e['Name'],
      e['Desc'],
      e['Indication'],
      e['Composition'],
      e['Dosage'],
      e['UseRule'],
      e['NoRegist'],
      e['Effect'],
      e['Manufacture']);
}

class DrugsModel {
  List<Data>? data;

  DrugsModel({this.data});

  DrugsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? description;
  String? benefits;
  List<String>? sideEffects;
  List<Dosage>? dosage;
  List<DangerousInteractions>? dangerousInteractions;

  Data(
      {this.name,
      this.description,
      this.benefits,
      this.sideEffects,
      this.dosage,
      this.dangerousInteractions});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    benefits = json['benefits'];
    sideEffects = json['sideEffects'].cast<String>();
    if (json['dosage'] != null) {
      dosage = <Dosage>[];
      json['dosage'].forEach((v) {
        dosage!.add(Dosage.fromJson(v));
      });
    }
    if (json['dangerousInteractions'] != null) {
      dangerousInteractions = <DangerousInteractions>[];
      json['dangerousInteractions'].forEach((v) {
        dangerousInteractions!.add(DangerousInteractions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['benefits'] = benefits;
    data['sideEffects'] = sideEffects;
    if (dosage != null) {
      data['dosage'] = dosage!.map((v) => v.toJson()).toList();
    }
    if (dangerousInteractions != null) {
      data['dangerousInteractions'] =
          dangerousInteractions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dosage {
  String? ageCategory;
  List<String>? dosageDrug;
  List<int>? intervalUsage;
  List<int>? intervalHours;
  String? maximumDosage;

  Dosage(
      {this.ageCategory,
      this.dosageDrug,
      this.intervalUsage,
      this.intervalHours,
      this.maximumDosage});

  Dosage.fromJson(Map<String, dynamic> json) {
    ageCategory = json['ageCategory'];
    dosageDrug = json['dosageDrug'].cast<String>();
    intervalUsage = json['intervalUsage'].cast<int>();
    intervalHours = json['intervalHours'].cast<int>();
    maximumDosage = json['maximumDosage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ageCategory'] = ageCategory;
    data['dosageDrug'] = dosageDrug;
    data['intervalUsage'] = intervalUsage;
    data['intervalHours'] = intervalHours;
    data['maximumDosage'] = maximumDosage;
    return data;
  }
}

class DangerousInteractions {
  String? nameDrug;
  String? reason;

  DangerousInteractions({this.nameDrug, this.reason});

  DangerousInteractions.fromJson(Map<String, dynamic> json) {
    nameDrug = json['nameDrug'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameDrug'] = nameDrug;
    data['reason'] = reason;
    return data;
  }
}
