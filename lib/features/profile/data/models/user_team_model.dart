class UserTeamModel {
  final String id;
  final String name;

  const UserTeamModel({
    required this.id,
    required this.name,
  });

  factory UserTeamModel.fromJson(Map<String, dynamic> json) {
    return UserTeamModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}