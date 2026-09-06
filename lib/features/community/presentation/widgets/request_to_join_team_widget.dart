import 'package:flutter/material.dart';
import 'package:footarena/common/models/user_model.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';

class RequestToJoinTeamWidget extends StatelessWidget {
final UserModel userModel;
final CommunityBloc communityBloc;

const RequestToJoinTeamWidget({
super.key,
required this.userModel,
required this.communityBloc,
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

final firstInitial =
firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
final lastInitial =
lastName.isNotEmpty ? lastName[0].toUpperCase() : '';

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
return Container(
margin: const EdgeInsets.only(bottom: 12),
decoration: BoxDecoration(
color: const Color(0xFF0A121D),
borderRadius: BorderRadius.circular(18),
border: Border.all(
color: const Color(0xFF1E2D42).withOpacity(0.5),
),
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
child: Row(
children: [
// Position
Expanded(
child: Row(
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
],
),
),

// Experience
Row(
children: [
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
],
),

const SizedBox(width: 12),

// Height
Row(
children: [
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
],
),
),
trailing: const Icon(
Icons.arrow_forward_ios,
color: Color(0xFF32455E),
size: 14,
),
),
);
}
}
