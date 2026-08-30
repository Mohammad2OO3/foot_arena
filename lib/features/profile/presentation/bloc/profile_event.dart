import 'package:footarena/features/profile/domain/use_cases/edit_profile_data_use_case.dart';

abstract class ProfileEvent {}

class FetchProfileDataEvent extends ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  final EditProfileDataParams params;

  EditProfileEvent(this.params);
}
