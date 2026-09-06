import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/helper/helper.dart';
import 'package:footarena/common/models/challenge_model.dart';

import '../bloc/community_bloc.dart';

class MatchCard extends StatelessWidget {
  final ChallengeModel challengeModel;
  final CommunityBloc communityBloc;

  const MatchCard({
    super.key,
    required this.challengeModel,
    required this.communityBloc,
  });

  @override
  Widget build(BuildContext context) {
    // التحقق ممّا إذا كان المستخدم الحالي هو صاحب الطلب
    final isOwner = challengeModel.createdByUserId == AppVariables.user?.id;

    return MultiBlocListener(
      listeners: [
        // listener حالة الموافقة (Accept)
        BlocListener<CommunityBloc, CommunityState>(
          bloc: communityBloc,
          listenWhen: (previous, current) =>
          previous.acceptChallengeData != current.acceptChallengeData,
          listener: (context, state) {
            state.acceptChallengeData?.listenerFunction(
              onSuccess: () {
                // إعادة تنشيط/تحديث البيانات بعد النجاح
                communityBloc.add(GetAllChallengeEvent());
              },
            );
          },
        ),

        // listener حالة الرفض (Reject)
        BlocListener<CommunityBloc, CommunityState>(
          bloc: communityBloc,
          listenWhen: (previous, current) =>
          previous.rejectChallengeData != current.rejectChallengeData,
          listener: (context, state) {
            state.rejectChallengeData?.listenerFunction(
              onSuccess: () {
                // إعادة تنشيط/تحديث البيانات بعد النجاح
                communityBloc.add(GetAllChallengeEvent());
              },
            );
          },
        ),

        // listener حالة الإلغاء (Cancel)
        BlocListener<CommunityBloc, CommunityState>(
          bloc: communityBloc,
          listenWhen: (previous, current) =>
          previous.cancelChallengeData != current.cancelChallengeData,
          listener: (context, state) {
            state.cancelChallengeData?.listenerFunction(
              onSuccess: () {
                // إعادة تنشيط/تحديث البيانات بعد النجاح
                communityBloc.add(GetAllChallengeEvent());
              },
            );
          },
        ),
      ],
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1B1D1C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00C853).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        challengeModel.field?.name ?? 'Field',
                        style: const TextStyle(
                            color: Color(0xFF00C853), fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      challengeModel.status ?? 'Cancel',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Text(
                  challengeModel.matchDate ?? '9:00',
                  style: const TextStyle(
                      color: Color(0xFF00C853), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              challengeModel.field?.name ?? 'Field',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.group_outlined, color: Colors.grey, size: 16),
                const SizedBox(width: 4),
                Text(
                  ((challengeModel.teamA?.membersCount ?? 0) +
                      (challengeModel.teamB?.membersCount ?? 0))
                      .toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    12.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const Spacer(),

                // الشروط الخاصة بإظهار الأزرار حسب المستخدم الحالي

                if(challengeModel.status=='cancelled'||challengeModel.status=='rejected'||challengeModel.status=='completed')...[
                  SizedBox()
                ]
               else if (isOwner) ...[
                  // زر إلغاء التحدي (Cancel)
                  ElevatedButton(
                    onPressed: () {
                      if (challengeModel.id != null) {
                        communityBloc.add(
                          CancelChallengeEvent(id: challengeModel.id!),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.2),
                      foregroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Cancel"),
                  ),
                ] else
                  ...[
                  // زر الرفض (Reject)
                  ElevatedButton(
                    onPressed: () {
                      if (challengeModel.id != null) {
                        communityBloc.add(
                          RejectChallengeEvent(id: challengeModel.id!),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.2),
                      foregroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Reject"),
                  ),
                  const SizedBox(width: 8),
                  // زر الموافقة (Accept)
                  ElevatedButton(
                    onPressed: () {
                      if (challengeModel.id != null) {
                        communityBloc.add(
                          AcceptChallengeEvent(id: challengeModel.id!),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF00C853).withOpacity(0.2),
                      foregroundColor: const Color(0xFF00C853),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Accept"),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}