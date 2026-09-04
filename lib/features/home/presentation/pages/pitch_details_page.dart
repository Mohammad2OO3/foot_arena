import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/community/domin/use_cases/add_challenge_use_case.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';
import 'package:footarena/features/field/presentation/bloc/field_bloc.dart';
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
  // String? selectedSlot;
  late final FieldBloc fieldBloc;
  late final ValueNotifier<SlotModel?> selectedSlot;
  late final ValueNotifier<DateTime?> selectedDate;
  late final CommunityBloc communityBloc;

  @override
  void initState() {
    selectedDate = ValueNotifier(null);
    communityBloc = getIt<CommunityBloc>()..add(GetMyTeamEvent());
    fieldBloc = widget.args.fieldBloc
      ..add(GetFieldDetailsEvent(id: widget.args.id));
    selectedSlot = ValueNotifier(null);

    // TODO: implement initState
    super.initState();
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
            onSuccess: () {},
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
                            ? SizedBox()
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
                                  ? SizedBox()
                                  : PitchAmenitiesList(
                                      features: data.data!.features!,
                                    ),
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
                                // onSlotSelected: (slot) {
                                //   setState(() {
                                //     selectedSlot = slot;
                                //   });
                                // },
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
                                    if (communityState.getMyTeamData.isFailed ||
                                        communityState
                                            .getMyTeamData
                                            .isLoading ||
                                        (communityState
                                                .getMyTeamData
                                                .data
                                                ?.data
                                                ?.id ==
                                            null)) {
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
                                    } else {
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
                                    }

                                    communityBloc.add(
                                      AddChallengeEvent(
                                        params: AddChallengeParams(
                                          opponentTeamId: communityState.getMyTeamData.data!.data!.id!,
                                          fieldId: state.getFieldDetailsData.data!.data!.id!,
                                          fieldSlotId: selectedSlot.value!.id!,
                                          matchDate: selectedDate.value!
                                              .toIso8601String()
                                              .split('T')
                                              .first,
                                          note: 'Note',
                                        ),
                                      ),
                                    );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialScreenRoute(
                                    //     builder: (context) => BookFieldScreen(
                                    //       pitch: widget.pitch,
                                    //       selectedTime: selectedSlot,
                                    //     ),
                                    //   ),
                                    // );
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
                failedWidget: SizedBox(),
                onTapRetry: () =>
                    fieldBloc.add(GetFieldDetailsEvent(id: widget.args.id)),
              );
            },
          );
        },
      ),
    );
  }
}

class PitchDetailsScreenParams {
  final int id;
  final FieldBloc fieldBloc;

  PitchDetailsScreenParams({required this.id, required this.fieldBloc});
}
