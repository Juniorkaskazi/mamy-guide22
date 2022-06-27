class DoctorModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNumber;
  String? yearsOfExperience;
  String? specialty;
  double? rate;
  int? numberOfRates;

  DoctorModel(
    this.uId,
    this.name,
    this.email,
    this.phoneNumber,
    this.yearsOfExperience,
    this.specialty,
    this.rate,
    this.numberOfRates,
  );

  DoctorModel.fromJason(Map<String, dynamic>? json) {
    uId = json!['uId'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    yearsOfExperience = json['yearsOfExperience'];
    specialty = json['specialty'];
    rate = json['rate'];
    numberOfRates = json['numberOfRates'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'uId': uId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'yearsOfExperience': yearsOfExperience,
      'specialty': specialty,
      'rate': rate,
      'numberOfRates': numberOfRates,
    };
    return map;
  }
}
