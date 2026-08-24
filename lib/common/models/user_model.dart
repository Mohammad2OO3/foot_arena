class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final int? age;
  final int? height;
  final int? weight;
  final int? experienceYears;
  final String? position;
  final String? accountType;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.age,
    this.height,
    this.weight,
    this.experienceYears,
    this.position,
    this.accountType,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    int? age,
    int? height,
    int? weight,
    int? experienceYears,
    String? position,
    String? accountType,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        experienceYears: experienceYears ?? this.experienceYears,
        position: position ?? this.position,
        accountType: accountType ?? this.accountType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    experienceYears: json["experience_years"],
    position: json["position"],
    accountType: json["account_type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "age": age,
    "height": height,
    "weight": weight,
    "experience_years": experienceYears,
    "position": position,
    "account_type": accountType,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
