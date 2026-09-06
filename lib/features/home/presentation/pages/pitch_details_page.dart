import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/community/domin/use_cases/add_challenge_use_case.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';
import 'package:footarena/features/field/presentation/bloc/field_bloc.dart';
import '../../../../common/models/team_model.dart';
import '../widgets/booking/booking_date_picker.dart';
import '../widgets/booking/booking_success_dialog.dart';
import '../widgets/pitch_details/pitch_amenities_list.dart';
import '../widgets/pitch_details/pitch_available_slots.dart';
import '../widgets/pitch_details/pitch_header_image.dart';
import '../widgets/pitch_details/pitch_info_header.dart';
import '../widgets/pitch_details/pitch_price_box.dart';

class PitchDetailsScreen extends StatefulWidget {
  final PitchDetailsScreenParams args;

  const PitchDetailsScreen({super.key, required this.args});

  @override
  State<PitchDetailsScreen> createState() => _PitchDetailsScreenState();
}

class _PitchDetailsScreenState extends State<PitchDetailsScreen> {
  late final FieldBloc fieldBloc;
  late final ValueNotifier<SlotModel?> selectedSlot;
  late final ValueNotifier<DateTime?> selectedDate;
  late final ValueNotifier<TeamModel?> selectedRivalTeam;
  late final CommunityBloc communityBloc;

  @override
  void initState() {
    selectedDate = ValueNotifier(null);
    selectedSlot = ValueNotifier(null);
    selectedRivalTeam = ValueNotifier(null);

    communityBloc = getIt<CommunityBloc>()..add(GetMyTeamEvent());

    fieldBloc = widget.args.fieldBloc
      ..add(GetFieldDetailsEvent(id: widget.args.id));

    super.initState();
  }

  @override
  void dispose() {
    selectedDate.dispose();
    selectedSlot.dispose();
    selectedRivalTeam.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<FieldBloc, FieldState>(
        bloc: fieldBloc,
        listenWhen: (pre, cur) =>
            pre.getFieldDetailsData.status != cur.getFieldDetailsData.status,
        listener: (context, state) {
          state.getFieldDetailsData.listenerWithOutLoadingFunction(
            onSuccess: () {
              communityBloc.add(GetAllTeamEvent());
            },
          );
        },
        builder: (context, state) {
          return BlocConsumer<CommunityBloc, CommunityState>(
            bloc: communityBloc,
            listener: (context, communityState) {
              communityState.addChallengeData.listenerFunction(
                onSuccess: () {
                  final bookingCode =
                      "FOOTARENA-3-${selectedDate.value!.millisecondsSinceEpoch}";

                  showDialog(
                    context: context,
                    builder: (context) => BookingSuccessDialog(
                      fieldName:
                          state.getFieldDetailsData.data?.data?.name ??
                          'Filed Name',
                      dateTime: selectedSlot.value!.startTime!,
                      totalPrice:
                          state.getFieldDetailsData.data?.data?.pricePerSlot ??
                          '0',
                      bookingCode: bookingCode,
                    ),
                  );
                },
              );
            },
            builder: (context, communityState) {
              return state.getFieldDetailsData.builder(
                onSuccess: (data) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data?.data?.mainImage?.path == null
                            ? const SizedBox()
                            : PitchHeaderImage(
                                imageUrl: data!.data!.mainImage!.path!,
                              ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PitchInfoHeader(fieldModel: data!.data!),

                              const SizedBox(height: 24),

                              data.data?.features == null
                                  ? const SizedBox()
                                  : PitchAmenitiesList(
                                      features: data.data!.features!,
                                    ),

                              const SizedBox(height: 24),

                              // =================================================
                              // SELECT RIVAL
                              // =================================================
                              const Text(
                                'Select rival',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              _buildRivalTeamDropdown(
                                communityState: communityState,
                              ),

                              // =================================================
                              const SizedBox(height: 24),

                              BookingDatePicker(
                                selectedDateNotifier: selectedDate,
                                onTap: () {
                                  if (selectedDate.value != null) {
                                    fieldBloc.add(
                                      GetAllSlotEvent(
                                        params: GetAllFieldSlotParams(
                                          date: selectedDate.value!
                                              .toIso8601String()
                                              .split('T')
                                              .first,
                                          fieldId: widget.args.id,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),

                              const SizedBox(height: 24),

                              PitchAvailableSlots(
                                selectedSlot: selectedSlot,
                                fieldBloc: fieldBloc,
                                id: widget.args.id,
                                selectedDateNotifier: selectedDate,
                              ),

                              const SizedBox(height: 24),

                              PitchPriceBox(
                                hourlyPrice: data.data?.pricePerSlot ?? '0',
                              ),

                              const SizedBox(height: 24),

                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // ==========================================
                                    // CHECK RIVAL TEAM
                                    // ==========================================

                                    if (communityState
                                        .getAllTeamData
                                        .isLoading) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please wait while teams are loading',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    if (communityState
                                        .getAllTeamData
                                        .isFailed) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('Failed to load teams'),
                                        ),
                                      );
                                      return;
                                    }

                                    if (selectedRivalTeam.value == null ||
                                        selectedRivalTeam.value!.id == null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please select a rival team first',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    // ==========================================
                                    // CHECK DATE
                                    // ==========================================

                                    if (selectedDate.value == null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please select a Date first',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    // ==========================================
                                    // CHECK SLOT
                                    // ==========================================

                                    if (selectedSlot.value == null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please select a time slot first',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    // ==========================================
                                    // CHECK MY TEAM
                                    // ==========================================

                                    if (communityState.getMyTeamData.isFailed ||
                                        communityState
                                            .getMyTeamData
                                            .isLoading ||
                                        communityState
                                                .getMyTeamData
                                                .data
                                                ?.data
                                                ?.id ==
                                            null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please belong to team first',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    // ==========================================
                                    // ADD CHALLENGE
                                    // ==========================================

                                    communityBloc.add(
                                      AddChallengeEvent(
                                        params: AddChallengeParams(
                                          opponentTeamId:
                                              selectedRivalTeam.value!.id!,
                                          fieldId: state
                                              .getFieldDetailsData
                                              .data!
                                              .data!
                                              .id!,
                                          fieldSlotId: selectedSlot.value!.id!,
                                          matchDate: selectedDate.value!
                                              .toIso8601String()
                                              .split('T')
                                              .first,
                                          note: 'Note',
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF00C853),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text(
                                    'Book Match',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                failedWidget: const SizedBox(),
                onTapRetry: () {
                  fieldBloc.add(GetFieldDetailsEvent(id: widget.args.id));
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildRivalTeamDropdown({required CommunityState communityState}) {
    // ============================================================
    // LOADING
    // ============================================================

    if (communityState.getAllTeamData.isLoading) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF00E676),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Loading teams...',
              style: TextStyle(color: Colors.white54, fontSize: 15),
            ),
          ],
        ),
      );
    }

    // ============================================================
    // FAILED
    // ============================================================

    if (communityState.getAllTeamData.isFailed) {
      return GestureDetector(
        onTap: () {
          communityBloc.add(GetAllTeamEvent());
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  communityState.getAllTeamData.errorMessage ??
                      'Failed to load teams',
                  style: const TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),
              const Icon(Icons.refresh, color: Colors.white54, size: 20),
            ],
          ),
        ),
      );
    }

    // ============================================================
    // SUCCESS
    // ============================================================

    return ValueListenableBuilder<TeamModel?>(
      valueListenable: selectedRivalTeam,
      builder: (context, selectedTeam, _) {
        return GestureDetector(
          onTap: () {
            _showRivalTeamBottomSheet(communityState);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedTeam?.name ?? 'Select rival team',
                    style: TextStyle(
                      color: selectedTeam == null
                          ? Colors.white54
                          : Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white54,
                  size: 22,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRivalTeamBottomSheet(CommunityState communityState) {
    final teams = communityState.getAllTeamData.data?.data ?? <TeamModel>[];

    if (teams.isEmpty) {
      showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xFF111827),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No teams available',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      );

      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111827),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    'Select rival team',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: teams.length,
                    separatorBuilder: (_, __) {
                      return const Divider(color: Colors.white10, height: 1);
                    },
                    itemBuilder: (context, index) {
                      final team = teams[index];

                      return ValueListenableBuilder<TeamModel?>(
                        valueListenable: selectedRivalTeam,
                        builder: (context, selectedTeam, _) {
                          final isSelected = selectedTeam?.id == team.id;

                          return ListTile(
                            onTap: () {
                              selectedRivalTeam.value = team;
                              Navigator.pop(context);
                            },
                            title: Text(
                              team.name ?? 'Unnamed team',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            subtitle:
                                team.description == null ||
                                    team.description!.isEmpty
                                ? null
                                : Text(
                                    team.description!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white54,
                                      fontSize: 13,
                                    ),
                                  ),
                            trailing: isSelected
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF00E676),
                                  )
                                : const Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white24,
                                  ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PitchDetailsScreenParams {
  final int id;
  final FieldBloc fieldBloc;

  PitchDetailsScreenParams({required this.id, required this.fieldBloc});
}
