import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/models/user_model.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';

class RequestToJoinTeamWidget extends StatelessWidget {
  final UserModel userModel;
  final CommunityBloc communityBloc;
  final int teamId;

  const RequestToJoinTeamWidget({
    super.key,
    required this.userModel,
    required this.communityBloc,
    required this.teamId,
  });

  String get name {
    final firstName = userModel.firstName?.trim() ?? '';
    final lastName = userModel.lastName?.trim() ?? '';

    return '$firstName $lastName'.trim().isEmpty
        ? 'Unknown Player'
        : '$firstName $lastName'.trim();
  }

  String get initials {
    final firstName = userModel.firstName?.trim() ?? '';
    final lastName = userModel.lastName?.trim() ?? '';

    final firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';

    return '$firstInitial$lastInitial'.isEmpty
        ? '?'
        : '$firstInitial$lastInitial';
  }

  String get position {
    return userModel.position?.trim().isNotEmpty == true
        ? userModel.position!.trim()
        : 'Unknown position';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CommunityBloc, CommunityState>(
          bloc: communityBloc,
          listenWhen: (previous, current) =>
              previous.acceptRequestToJointData !=
              current.acceptRequestToJointData,
          listener: (context, state) {
            state.acceptRequestToJointData.listenerFunction(
              onSuccess: () {
                communityBloc.add(GetAllRequestToJointEvent(id: teamId));
              },
            );
          },
        ),
        BlocListener<CommunityBloc, CommunityState>(
          bloc: communityBloc,
          listenWhen: (previous, current) =>
              previous.rejectRequestToJointData !=
              current.rejectRequestToJointData,
          listener: (context, state) {
            state.rejectRequestToJointData.listenerFunction(
              onSuccess: () {
                communityBloc.add(GetAllRequestToJointEvent(id: teamId));
              },
            );
          },
        ),
      ],
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0A121D),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF1E2D42).withOpacity(0.5)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF1E2D42),
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          title: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.sports_soccer,
                      color: Color(0xFF8C9BAE),
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        position,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF8C9BAE),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.workspace_premium_outlined,
                      color: Color(0xFF8C9BAE),
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${userModel.experienceYears ?? 0} yrs',
                      style: const TextStyle(
                        color: Color(0xFF8C9BAE),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.height,
                      color: Color(0xFF8C9BAE),
                      size: 15,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${userModel.height ?? 0} cm',
                      style: const TextStyle(
                        color: Color(0xFF8C9BAE),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          communityBloc.add(
                            AcceptRequestToJointEvent(id: userModel.id!),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF22C55E),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          communityBloc.add(
                            RejectRequestToJointEvent(id: userModel.id!),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF4444),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Reject',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
