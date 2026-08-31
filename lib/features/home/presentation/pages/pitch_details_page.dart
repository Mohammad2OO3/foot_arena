import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';
import 'package:footarena/features/field/presentation/bloc/field_bloc.dart';
import '../../../../common/helper/helper.dart';
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

  @override
  void initState() {
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
            onSuccess: () {
              fieldBloc.add(
                GetAllSlotEvent(
                  params: GetAllFieldSlotParams(
                    date: DateTime.now().toIso8601String().split('T').first,
// الناتج: "2026-08-31",
                    fieldId: widget.args.id,
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
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
                          PitchAvailableSlots(
                            selectedSlot: selectedSlot,
                            fieldBloc: fieldBloc,
                            id: widget.args.id,
                            // onSlotSelected: (slot) {
                            //   setState(() {
                            //     selectedSlot = slot;
                            //   });
                            // },
                          ),
                          const SizedBox(height: 24),
                          PitchPriceBox(
                            hourlyPrice: data?.data?.pricePerSlot ?? '0',
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedSlot == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please select a time slot first',
                                      ),
                                    ),
                                  );
                                  return;
                                }

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
      ),
    );
  }
}

class PitchDetailsScreenParams {
  final int id;
  final FieldBloc fieldBloc;

  PitchDetailsScreenParams({required this.id, required this.fieldBloc});
}
