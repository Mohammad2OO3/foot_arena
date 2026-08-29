import 'package:footarena/common/models/team_model.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'booking_model.dart';
import 'field_model.dart';

class ChallengeModel {
  final int? id;
  final TeamModel? teamA;
  final TeamModel? teamB;
  final int? createdByUserId;
  final FieldModel? field;
  final SlotModel? fieldSlot;
  final String? matchDate;
  final String? note;
  final String? status;
  final BookingModel? booking;
  final String? acceptedAt;
  final String? rejectedAt;
  final String? cancelledAt;
  final String? completedAt;
  final String? createdAt;
  final String? updatedAt;

  ChallengeModel({
    this.id,
    this.teamA,
    this.teamB,
    this.createdByUserId,
    this.field,
    this.fieldSlot,
    this.matchDate,
    this.note,
    this.status,
    this.booking,
    this.acceptedAt,
    this.rejectedAt,
    this.cancelledAt,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  ChallengeModel copyWith({
    int? id,
    TeamModel? teamA,
    TeamModel? teamB,
    int? createdByUserId,
    FieldModel? field,
    SlotModel? fieldSlot,
    String? matchDate,
    String? note,
    String? status,
    BookingModel? booking,
    String? acceptedAt,
    String? rejectedAt,
    String? cancelledAt,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      ChallengeModel(
        id: id ?? this.id,
        teamA: teamA ?? this.teamA,
        teamB: teamB ?? this.teamB,
        createdByUserId: createdByUserId ?? this.createdByUserId,
        field: field ?? this.field,
        fieldSlot: fieldSlot ?? this.fieldSlot,
        matchDate: matchDate ?? this.matchDate,
        note: note ?? this.note,
        status: status ?? this.status,
        booking: booking ?? this.booking,
        acceptedAt: acceptedAt ?? this.acceptedAt,
        rejectedAt: rejectedAt ?? this.rejectedAt,
        cancelledAt: cancelledAt ?? this.cancelledAt,
        completedAt: completedAt ?? this.completedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ChallengeModel.fromJson(Map<String, dynamic> json) => ChallengeModel(
    id: json["id"],
    teamA: json["team_a"] == null ? null : TeamModel.fromJson(json["team_a"]),
    teamB: json["team_b"] == null ? null : TeamModel.fromJson(json["team_b"]),
    createdByUserId: json["created_by_user_id"],
    field: json["field"] == null ? null : FieldModel.fromJson(json["field"]),
    fieldSlot: json["field_slot"] == null ? null : SlotModel.fromJson(json["field_slot"]),
    matchDate: json["match_date"],
    note: json["note"],
    status: json["status"],
    booking: json["booking"] == null ? null : BookingModel.fromJson(json["booking"]),
    acceptedAt: json["accepted_at"],
    rejectedAt: json["rejected_at"],
    cancelledAt: json["cancelled_at"],
    completedAt: json["completed_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_a": teamA?.toJson(),
    "team_b": teamB?.toJson(),
    "created_by_user_id": createdByUserId,
    "field": field?.toJson(),
    "field_slot": fieldSlot?.toJson(),
    "match_date": matchDate,
    "note": note,
    "status": status,
    "booking": booking?.toJson(),
    "accepted_at": acceptedAt,
    "rejected_at": rejectedAt,
    "cancelled_at": cancelledAt,
    "completed_at": completedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

