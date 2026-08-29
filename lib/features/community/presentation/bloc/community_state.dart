part of 'community_bloc.dart';

enum CommunityTab { matches, players, teams }

class CommunityState {
  final CommunityTab selectedTab;

  // Teams
  final DataStateModel<GetAllTeamResponse?> getAllTeamData;
  final DataStateModel<GetMyTeamResponse?> getTeamDetailsData;
  final DataStateModel<GetMyTeamResponse?> getMyTeamData;
  final DataStateModel<GetMyTeamResponse?> addTeamData;
  final DataStateModel<GetMyTeamResponse?> transferTeamData;

  // Requests to join team
  final DataStateModel<GetAllRequestToTeamResponse?> getAllRequestToJointData;
  final DataStateModel<RequestToTeamResponse?> requestToJointData;
  final DataStateModel<RequestToTeamResponse?> acceptRequestToJointData;
  final DataStateModel<RequestToTeamResponse?> rejectRequestToJointData;

  // Challenges
  final DataStateModel<GetAllChallengeResponse?> getAllChallengeData;
  final DataStateModel<ChallengeResponse?> getChallengeDetailsData;
  final DataStateModel<ChallengeResponse?> addChallengeData;
  final DataStateModel<ChallengeResponse?> acceptChallengeData;
  final DataStateModel<ChallengeResponse?> cancelChallengeData;
  final DataStateModel<ChallengeResponse?> rejectChallengeData;

  const CommunityState({
    this.selectedTab = CommunityTab.matches,

    // Teams
    this.getAllTeamData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.getTeamDetailsData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.getMyTeamData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.addTeamData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.transferTeamData =
    const DataStateModel.setDefultValue(defultValue: null),

    // Requests
    this.getAllRequestToJointData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.requestToJointData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.acceptRequestToJointData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.rejectRequestToJointData =
    const DataStateModel.setDefultValue(defultValue: null),

    // Challenges
    this.getAllChallengeData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.getChallengeDetailsData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.addChallengeData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.acceptChallengeData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.cancelChallengeData =
    const DataStateModel.setDefultValue(defultValue: null),
    this.rejectChallengeData =
    const DataStateModel.setDefultValue(defultValue: null),
  });

  CommunityState copyWith({
    CommunityTab? selectedTab,

    // Teams
    DataStateModel<GetAllTeamResponse?>? getAllTeamData,
    DataStateModel<GetMyTeamResponse?>? getTeamDetailsData,
    DataStateModel<GetMyTeamResponse?>? getMyTeamData,
    DataStateModel<GetMyTeamResponse?>? addTeamData,
    DataStateModel<GetMyTeamResponse?>? transferTeamData,

    // Requests
    DataStateModel<GetAllRequestToTeamResponse?>? getAllRequestToJointData,
    DataStateModel<RequestToTeamResponse?>? requestToJointData,
    DataStateModel<RequestToTeamResponse?>? acceptRequestToJointData,
    DataStateModel<RequestToTeamResponse?>? rejectRequestToJointData,

    // Challenges
    DataStateModel<GetAllChallengeResponse?>? getAllChallengeData,
    DataStateModel<ChallengeResponse?>? getChallengeDetailsData,
    DataStateModel<ChallengeResponse?>? addChallengeData,
    DataStateModel<ChallengeResponse?>? acceptChallengeData,
    DataStateModel<ChallengeResponse?>? cancelChallengeData,
    DataStateModel<ChallengeResponse?>? rejectChallengeData,
  }) {
    return CommunityState(
      selectedTab: selectedTab ?? this.selectedTab,

      // Teams
      getAllTeamData: getAllTeamData ?? this.getAllTeamData,
      getTeamDetailsData: getTeamDetailsData ?? this.getTeamDetailsData,
      getMyTeamData: getMyTeamData ?? this.getMyTeamData,
      addTeamData: addTeamData ?? this.addTeamData,
      transferTeamData: transferTeamData ?? this.transferTeamData,

      // Requests
      getAllRequestToJointData:
      getAllRequestToJointData ?? this.getAllRequestToJointData,
      requestToJointData: requestToJointData ?? this.requestToJointData,
      acceptRequestToJointData:
      acceptRequestToJointData ?? this.acceptRequestToJointData,
      rejectRequestToJointData:
      rejectRequestToJointData ?? this.rejectRequestToJointData,

      // Challenges
      getAllChallengeData:
      getAllChallengeData ?? this.getAllChallengeData,
      getChallengeDetailsData:
      getChallengeDetailsData ?? this.getChallengeDetailsData,
      addChallengeData: addChallengeData ?? this.addChallengeData,
      acceptChallengeData:
      acceptChallengeData ?? this.acceptChallengeData,
      cancelChallengeData:
      cancelChallengeData ?? this.cancelChallengeData,
      rejectChallengeData:
      rejectChallengeData ?? this.rejectChallengeData,
    );
  }
}