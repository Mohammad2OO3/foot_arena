// import 'package:equatable/equatable.dart';
//
// import '../../data/models/user_match_model.dart';
// import '../../data/models/user_response.dart';
// import '../../data/models/user_team_model.dart';
//
// abstract class ProfileState extends Equatable {
//   const ProfileState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// /// الحالة الأولى قبل بدء أي عملية
// class ProfileInitialState extends ProfileState {}
//
// /// حالة التحميل (Loading Indicator)
// class ProfileLoadingState extends ProfileState {}
//
// /// حالة النجاح وجلب البيانات بنجاح
// class ProfileLoadedState extends ProfileState {
//   final UserProfileModel profile;
//   final List<UserMatchModel> matches;
//   final List<UserTeamModel> teams;
//
//   const ProfileLoadedState({
//     required this.profile,
//     required this.matches,
//     required this.teams,
//   });
//
//   @override
//   List<Object?> get props => [profile, matches, teams];
// }
//
// /// حالة الفشل وحدوث خطأ
// class ProfileErrorState extends ProfileState {
//   final String message;
//
//   const ProfileErrorState(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }

import 'package:footarena/common/helper/helper.dart';
import 'package:footarena/features/profile/data/models/user_response.dart';

class ProfileState {
  final DataStateModel<UserResponse?> getProfileData;

  ProfileState({
    this.getProfileData = const DataStateModel.setDefultValue(defultValue: null),
  });


  ProfileState copyWith({
    DataStateModel<UserResponse?>? getProfileData,
  }) {
    return ProfileState(
      getProfileData: getProfileData ?? this.getProfileData,
    );
  }
}
