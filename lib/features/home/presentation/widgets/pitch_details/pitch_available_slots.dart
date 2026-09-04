import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/design/design.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';
import 'package:footarena/features/field/presentation/bloc/field_bloc.dart';

import '../../../../../common/helper/helper.dart';

class PitchAvailableSlots extends StatefulWidget {
  final FieldBloc fieldBloc;
  final int id;
  final ValueNotifier<SlotModel?> selectedSlot;
  final ValueNotifier<DateTime?> selectedDateNotifier;


  const PitchAvailableSlots({
    super.key,
    required this.fieldBloc,
    required this.id,
    required this.selectedSlot,
    required this.selectedDateNotifier,
  });

  @override
  State<PitchAvailableSlots> createState() => _PitchAvailableSlotsState();
}

class _PitchAvailableSlotsState extends State<PitchAvailableSlots> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Time Slots',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<FieldBloc, FieldState>(
          bloc: widget.fieldBloc,
          builder: (context, state) {
            return state.getAllSlotsData.builder(
              onSuccess: (data) {
                return data!.data!.isNotEmpty||widget.selectedDateNotifier.value!=null
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.8,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: data!.data!.length,
                        itemBuilder: (context, index) {
                          final SlotModel slot = data.data![index];
                          return ValueListenableBuilder(
                            valueListenable: widget.selectedSlot,
                            builder: (context, value, child) {
                              final isSelected =
                                  widget.selectedSlot.value?.id == slot.id;

                              return GestureDetector(
                                onTap: () {
                                  widget.selectedSlot.value = slot;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF00E676)
                                        : const Color(0xFF111827),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected
                                          ? const Color(0xFF00E676)
                                          : Colors.white10,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${slot.startTime}-${slot.endTime}',
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )
                    : SizedBox();
              },
              onTapRetry: () => widget.fieldBloc.add(
                GetAllSlotEvent(
                  params: GetAllFieldSlotParams(
                    date:  DateTime.now().toIso8601String().split('T').first,
                    fieldId: widget.id,
                  ),
                ),
              ),
              loadingWidget:widget.selectedDateNotifier.value==null? SizedBox():LoadingWidget()
            );
          },
        ),
      ],
    );
  }
}
