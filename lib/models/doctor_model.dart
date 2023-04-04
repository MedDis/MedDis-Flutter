class DoctorModel {
  String name;
  String image;
  String specialist;
  String hospital;
  String experience;
  List<double> latitudeLongitude;
  int patients;
  DoctorModel({
    required this.name,
    required this.image,
    required this.specialist,
    required this.hospital,
    required this.experience,
    required this.latitudeLongitude,
    required this.patients,
  });
}
