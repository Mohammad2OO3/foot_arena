class UserMatchModel {
  final String id;
  final String title;
  final String date;
  final String status;
  final bool isWon;

  const UserMatchModel({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.isWon,
  });

  factory UserMatchModel.fromJson(Map<String, dynamic> json) {
    return UserMatchModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      isWon: json['is_won'] ?? false,
    );
  }
}