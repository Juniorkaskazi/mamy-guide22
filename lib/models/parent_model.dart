class ParentModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNumber;
  String? babyName;
  String? babyBirthday;
  String? gender;
  String? address;
  String? bloodType;

  ParentModel(
    this.uId,
    this.name,
    this.email,
    this.phoneNumber,
    this.babyName,
    this.babyBirthday,
    this.gender,
    this.address,
    this.bloodType,
  );

  ParentModel.fromJason(Map<String, dynamic>? json) {
    uId = json!['uId'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    babyName = json['babyName'];
    babyBirthday = json['babyBirthday'];
    gender = json['gender'];
    address = json['address'];
    bloodType = json['bloodType'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'uId': uId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'babyName': babyName,
      'babyBirthday': babyBirthday,
      'gender': gender,
      'address': address,
      'bloodType': bloodType,
    };
    return map;
  }
}
