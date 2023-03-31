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
