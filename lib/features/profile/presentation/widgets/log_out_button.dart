import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/src/context_extensions.dart';
import '../../../../router/app_router.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    required this.authBloc,
  });

  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        state.logOutData.listenerFunction(
          onSuccess: () {
            context.pushNamedAndRemoveUntil(
              RouteName.splash,
                  (e) => false,
            );
          },
        );
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12),
                        Text(
                          "Confirm Logout",
                          style: context.headlineSmall(
                            fontSize: 20,
                            color: context.textColor,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Are you sure you want to log out of the app?",
                          style: context.bodySmall(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: context
                                      .headlineSmall(
                                    color: context
                                        .primarySwatch,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                child: Text(
                                  "Log Out",
                                  style: context
                                      .headlineSmall(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {

                                  authBloc.add(LogOutEvent());
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  );
                },
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3E1014),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: Colors.redAccent),
                SizedBox(width: 8),
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
