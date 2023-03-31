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
