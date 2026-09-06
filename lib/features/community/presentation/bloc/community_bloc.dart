import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:footarena/features/community/data/model/get_all_players_response.dart';
import 'package:footarena/features/community/domin/use_cases/get_all_players_use_case.dart';
import 'package:footarena/features/community/domin/use_cases/leave_team_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/data_state_model.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/challenge_response.dart';
import '../../data/model/get_all_challenge_response.dart';
import '../../data/model/get_all_request_to_team_response.dart';
import '../../data/model/get_all_team_response.dart';
import '../../data/model/get_my_team_response.dart';
import '../../data/model/request_to_team_response.dart';
import '../../domin/use_cases/accept_challenge_use_case.dart';
import '../../domin/use_cases/accept_request_to_join_use_case.dart';
import '../../domin/use_cases/add_challenge_use_case.dart';
import '../../domin/use_cases/add_team_use_case.dart';
import '../../domin/use_cases/cancel_challenge_use_case.dart';
import '../../domin/use_cases/get_all_challenge_use_case.dart';
import '../../domin/use_cases/get_all_request_to_join_use_case.dart';
import '../../domin/use_cases/get_all_team_use_case.dart';
import '../../domin/use_cases/get_challenge_details_use_case.dart';
import '../../domin/use_cases/get_my_team_use_case.dart';
import '../../domin/use_cases/get_team_details_use_case.dart';
import '../../domin/use_cases/reject_challenge_use_case.dart';
import '../../domin/use_cases/reject_request_to_join_use_case.dart';
import '../../domin/use_cases/request_to_join_use_case.dart';
import '../../domin/use_cases/transfer_team_use_case.dart';


part 'community_event.dart';
part 'community_state.dart';

@injectable
class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final GetAllTeamUseCase _getAllTeamUseCase;
  final GetTeamDetailsUseCase _getTeamDetailsUseCase;
  final GetMyTeamUseCase _getMyTeamUseCase;
  final AddTeamUseCase _addTeamUseCase;
  final TransferTeamUseCase _transferTeamUseCase;
  final LeaveTeamUseCase _leaveTeamUseCase;

  final GetAllRequestToJoinUseCase _getAllRequestToJointUseCase;
  final RequestToJoinUseCase _requestToJointUseCase;
  final AcceptRequestToJoinUseCase _acceptRequestToJointUseCase;
  final RejectRequestToJoinUseCase _rejectRequestToJointUseCase;

  final GetAllChallengeUseCase _getAllChallengeUseCase;
  final GetChallengeDetailsUseCase _getChallengeDetailsUseCase;
  final AddChallengeUseCase _addChallengeUseCase;
  final AcceptChallengeUseCase _acceptChallengeUseCase;
  final CancelChallengeUseCase _cancelChallengeUseCase;
  final RejectChallengeUseCase _rejectChallengeUseCase;
  final GetAllPlayersUseCase _getAllPlayersUseCase;

  CommunityBloc(
      this._leaveTeamUseCase,
      this._getAllTeamUseCase,
      this._getTeamDetailsUseCase,
      this._getMyTeamUseCase,
      this._addTeamUseCase,
      this._transferTeamUseCase,
      this._getAllRequestToJointUseCase,
      this._requestToJointUseCase,
      this._acceptRequestToJointUseCase,
      this._rejectRequestToJointUseCase,
      this._getAllChallengeUseCase,
      this._getChallengeDetailsUseCase,
      this._addChallengeUseCase,
      this._acceptChallengeUseCase,
      this._cancelChallengeUseCase,
      this._rejectChallengeUseCase,
      this._getAllPlayersUseCase,
      ) : super(const CommunityState()) {
    on<ChangeTabEvent>(_changeTab);

    // Teams
    on<LeaveTeamEvent>(_leaveTeam);
    on<GetAllTeamEvent>(_getAllTeam);
    on<GetTeamDetailsEvent>(_getTeamDetails);
    on<GetMyTeamEvent>(_getMyTeam);
    on<AddTeamEvent>(_addTeam);
    on<TransferTeamEvent>(_transferTeam);

    // Requests
    on<GetAllRequestToJointEvent>(_getAllRequestToJoint);
    on<RequestToJointEvent>(_requestToJoint);
    on<AcceptRequestToJointEvent>(_acceptRequestToJoint);
    on<RejectRequestToJointEvent>(_rejectRequestToJoint);

    // Challenges
    on<GetAllChallengeEvent>(_getAllChallenge);
    on<GetChallengeDetailsEvent>(_getChallengeDetails);
    on<AddChallengeEvent>(_addChallenge);
    on<AcceptChallengeEvent>(_acceptChallenge);
    on<CancelChallengeEvent>(_cancelChallenge);
    on<RejectChallengeEvent>(_rejectChallenge);
    on<GetAllPlayersEvent>(_getAllPlayers);
  }

  FutureOr<void> _getAllPlayers(
      GetAllPlayersEvent event,
      Emitter<CommunityState> emit,
      )
  async {
    emit(
      state.copyWith(
        getAllPlayersData: state.getAllPlayersData.setLoading(),
      ),
    );

    final val = await _getAllPlayersUseCase(NoParams());

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getAllPlayersData: state.getAllPlayersData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getAllPlayersData: state.getAllPlayersData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }
  // ---------------------------------------------------------------------------
  // Tab
  // ---------------------------------------------------------------------------

  FutureOr<void> _changeTab(
      ChangeTabEvent event,
      Emitter<CommunityState> emit,
      ) {
    emit(
      state.copyWith(
        selectedTab: event.selectedTab,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Teams
  // ---------------------------------------------------------------------------

  FutureOr<void> _getAllTeam(
      GetAllTeamEvent event,
      Emitter<CommunityState> emit,
      )
  async {
    emit(
      state.copyWith(
        getAllTeamData: state.getAllTeamData.setLoading(),
      ),
    );

    final val = await _getAllTeamUseCase(NoParams());

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getAllTeamData: state.getAllTeamData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getAllTeamData: state.getAllTeamData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }

  FutureOr<void> _getTeamDetails(
      GetTeamDetailsEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        getTeamDetailsData: state.getTeamDetailsData.setLoading(),
      ),
    );

    final val = await _getTeamDetailsUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getTeamDetailsData: state.getTeamDetailsData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getTeamDetailsData: state.getTeamDetailsData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

  }

  FutureOr<void> _getMyTeam(
      GetMyTeamEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        getMyTeamData: state.getMyTeamData.setLoading(),
      ),
    );

    final val = await _getMyTeamUseCase(NoParams());

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getMyTeamData: state.getMyTeamData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getMyTeamData: state.getMyTeamData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }

  FutureOr<void> _addTeam(
      AddTeamEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        addTeamData: state.addTeamData.setLoading(),
      ),
    );

    final val = await _addTeamUseCase(event.params);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            addTeamData: state.addTeamData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            addTeamData: state.addTeamData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        addTeamData: state.addTeamData.resetData(),
      ),
    );
  }

  FutureOr<void> _transferTeam(
      TransferTeamEvent event,
      Emitter<CommunityState> emit,
      )
  async {
    emit(
      state.copyWith(
        transferTeamData: state.transferTeamData.setLoading(),
      ),
    );

    final val = await _transferTeamUseCase(event.params);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            transferTeamData: state.transferTeamData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            transferTeamData: state.transferTeamData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        transferTeamData: state.transferTeamData.resetData(),
      ),
    );
  }

  FutureOr<void> _leaveTeam(
      LeaveTeamEvent event,
      Emitter<CommunityState> emit,
      )
  async {
    emit(
      state.copyWith(
        leaveTeamData: state.leaveTeamData.setLoading(),
      ),
    );

    final val = await _leaveTeamUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            leaveTeamData: state.leaveTeamData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            leaveTeamData: state.leaveTeamData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        transferTeamData: state.transferTeamData.resetData(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Requests to Join Team
  // ---------------------------------------------------------------------------

  FutureOr<void> _getAllRequestToJoint(
      GetAllRequestToJointEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        getAllRequestToJointData:
        state.getAllRequestToJointData.setLoading(),
      ),
    );

    final val = await _getAllRequestToJointUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getAllRequestToJointData:
            state.getAllRequestToJointData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getAllRequestToJointData:
            state.getAllRequestToJointData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }

  FutureOr<void> _requestToJoint(
      RequestToJointEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        requestToJointData: state.requestToJointData.setLoading(),
      ),
    );

    final val = await _requestToJointUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            requestToJointData: state.requestToJointData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            requestToJointData: state.requestToJointData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        requestToJointData: state.requestToJointData.resetData(),
      ),
    );
  }

  FutureOr<void> _acceptRequestToJoint(
      AcceptRequestToJointEvent event,
      Emitter<CommunityState> emit,
      )
  async {
    emit(
      state.copyWith(
        acceptRequestToJointData:
        state.acceptRequestToJointData.setLoading(),
      ),
    );

    final val = await _acceptRequestToJointUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            acceptRequestToJointData:
            state.acceptRequestToJointData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            acceptRequestToJointData:
            state.acceptRequestToJointData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        acceptRequestToJointData:
        state.acceptRequestToJointData.resetData(),
      ),
    );
  }

  FutureOr<void> _rejectRequestToJoint(
      RejectRequestToJointEvent event,
      Emitter<CommunityState> emit,
      )
  async {
    emit(
      state.copyWith(
        rejectRequestToJointData:
        state.rejectRequestToJointData.setLoading(),
      ),
    );

    final val = await _rejectRequestToJointUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            rejectRequestToJointData:
            state.rejectRequestToJointData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            rejectRequestToJointData:
            state.rejectRequestToJointData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        rejectRequestToJointData:
        state.rejectRequestToJointData.resetData(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Challenges
  // ---------------------------------------------------------------------------

  FutureOr<void> _getAllChallenge(
      GetAllChallengeEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        getAllChallengeData: state.getAllChallengeData.setLoading(),
      ),
    );

    final val = await _getAllChallengeUseCase(NoParams());

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getAllChallengeData: state.getAllChallengeData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getAllChallengeData: state.getAllChallengeData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }

  FutureOr<void> _getChallengeDetails(
      GetChallengeDetailsEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        getChallengeDetailsData:
        state.getChallengeDetailsData.setLoading(),
      ),
    );

    final val = await _getChallengeDetailsUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            getChallengeDetailsData:
            state.getChallengeDetailsData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            getChallengeDetailsData:
            state.getChallengeDetailsData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }

  FutureOr<void> _addChallenge(
      AddChallengeEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        addChallengeData: state.addChallengeData.setLoading(),
      ),
    );

    final val = await _addChallengeUseCase(event.params);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            addChallengeData: state.addChallengeData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            addChallengeData: state.addChallengeData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        addChallengeData: state.addChallengeData.resetData(),
      ),
    );
  }

  FutureOr<void> _acceptChallenge(
      AcceptChallengeEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        acceptChallengeData: state.acceptChallengeData.setLoading(),
      ),
    );

    final val = await _acceptChallengeUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            acceptChallengeData:
            state.acceptChallengeData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            acceptChallengeData:
            state.acceptChallengeData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        acceptChallengeData:
        state.acceptChallengeData.resetData(),
      ),
    );
  }

  FutureOr<void> _cancelChallenge(
      CancelChallengeEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        cancelChallengeData: state.cancelChallengeData.setLoading(),
      ),
    );

    final val = await _cancelChallengeUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            cancelChallengeData:
            state.cancelChallengeData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            cancelChallengeData:
            state.cancelChallengeData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );


  }

  FutureOr<void> _rejectChallenge(
      RejectChallengeEvent event,
      Emitter<CommunityState> emit,
      ) async {
    emit(
      state.copyWith(
        rejectChallengeData: state.rejectChallengeData.setLoading(),
      ),
    );

    final val = await _rejectChallengeUseCase(event.id);

    val.fold(
          (l) {
        emit(
          state.copyWith(
            rejectChallengeData:
            state.rejectChallengeData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
          (r) {
        emit(
          state.copyWith(
            rejectChallengeData:
            state.rejectChallengeData.setSuccess(
              data: r,
            ),
          ),
        );
      },
    );

    if (emit.isDone) return;

    emit(
      state.copyWith(
        rejectChallengeData:
        state.rejectChallengeData.resetData(),
      ),
    );
  }
}