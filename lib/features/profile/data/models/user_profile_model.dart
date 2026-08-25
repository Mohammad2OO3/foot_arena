class UserProfileModel {
  final String id;
  final String name;
  final String position;
  final int matchesCount;
  final int teamsCount;
  final int age;
  final int height;
  final int weight;
  final int experienceYears;

  const UserProfileModel({
    required this.id,
    required this.name,
    required this.position,
    required this.matchesCount,
    required this.teamsCount,
    required this.age,
    required this.height,
    required this.weight,
    required this.experienceYears,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      matchesCount: json['matches_count'] ?? 0,
      teamsCount: json['teams_count'] ?? 0,
      age: json['age'] ?? 0,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      experienceYears: json['experience_years'] ?? 0,
    );
  }
}