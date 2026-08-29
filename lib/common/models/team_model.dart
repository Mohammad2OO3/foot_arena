class TeamModel {
  final int? id;
  final String? name;
  final String? description;
  final CaptainModel? captain;
  final int? membersCount;
  final List<MemberModel>? members;
  final String? pendingJoinRequestsCount;
  final String? createdAt;
  final String? updatedAt;

  TeamModel({
    this.id,
    this.name,
    this.description,
    this.captain,
    this.membersCount,
    this.members,
    this.pendingJoinRequestsCount,
    this.createdAt,
    this.updatedAt,
  });

  TeamModel copyWith({
    int? id,
    String? name,
    String? description,
    CaptainModel? captain,
    int? membersCount,
    List<MemberModel>? members,
    String? pendingJoinRequestsCount,
    String? createdAt,
    String? updatedAt,
  }) =>
      TeamModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        captain: captain ?? this.captain,
        membersCount: membersCount ?? this.membersCount,
        members: members ?? this.members,
        pendingJoinRequestsCount: pendingJoinRequestsCount ?? this.pendingJoinRequestsCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    captain: json["captain"] == null ? null : CaptainModel.fromJson(json["captain"]),
    membersCount: json["members_count"],
    members: json["members"] == null ? [] : List<MemberModel>.from(json["members"]!.map((x) => MemberModel.fromJson(x))),
    pendingJoinRequestsCount: json["pending_join_requests_count"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "captain": captain?.toJson(),
    "members_count": membersCount,
    "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x.toJson())),
    "pending_join_requests_count": pendingJoinRequestsCount,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class CaptainModel {
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

  CaptainModel({
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

  CaptainModel copyWith({
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
      CaptainModel(
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

  factory CaptainModel.fromJson(Map<String, dynamic> json) => CaptainModel(
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

class MemberModel {
  final int? id;
  final int? teamId;
  final CaptainModel? user;
  final String? joinedAt;

  MemberModel({
    this.id,
    this.teamId,
    this.user,
    this.joinedAt,
  });

  MemberModel copyWith({
    int? id,
    int? teamId,
    CaptainModel? user,
    String? joinedAt,
  }) =>
      MemberModel(
        id: id ?? this.id,
        teamId: teamId ?? this.teamId,
        user: user ?? this.user,
        joinedAt: joinedAt ?? this.joinedAt,
      );

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
    id: json["id"],
    teamId: json["team_id"],
    user: json["user"] == null ? null : CaptainModel.fromJson(json["user"]),
    joinedAt: json["joined_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_id": teamId,
    "user": user?.toJson(),
    "joined_at": joinedAt,
  };
}
