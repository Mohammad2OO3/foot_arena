class User {
  final String? id;
  final String email;

  final String? firstName;
  final String? lastName;

  final String? phone;
  final int? age;
  final double? height;
  final double? weight;

  final String? position;
  final int? yearsPlayed;
  final int? rating;

  User({
    this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.age,
    this.height,
    this.weight,
    this.position,
    this.yearsPlayed,
    this.rating,
  });
}