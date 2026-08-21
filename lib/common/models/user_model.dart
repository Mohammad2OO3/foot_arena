

class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? gender;
  final DateTime? birthDate; // خليها DateTime بدل dynamic
  final bool? phoneVerified;


  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.birthDate,
    this.phoneVerified,

  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? gender,
    DateTime? birthDate,
    bool? phoneVerified,

  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        phoneVerified: phoneVerified ?? this.phoneVerified,

      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    gender: json["gender"],
    birthDate: json["birthDate"] == null
        ? null
        : DateTime.tryParse(json["birthDate"]), // تحويل String إلى DateTime
    phoneVerified: json["phoneVerified"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "gender": gender,
    "birthDate": birthDate == null
        ? null
        : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
    "phoneVerified": phoneVerified,
  };
}




