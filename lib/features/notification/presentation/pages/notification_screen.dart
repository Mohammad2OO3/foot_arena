import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../common/design/src/widgets/custom_back_button_icon.dart';
import '../../../../common/design/src/widgets/my_custom_scaffold.dart';
import '../../../../common/extensions/src/context_extensions.dart';
import '../../../../common/helper/src/locale_keys.dart';
import '../bloc/notification_bloc.dart';
import '../widgets/notification_list_tile_widget.dart';
import '../widgets/notification_loading_widget.dart';

class NotificationScreen extends StatefulWidget {
  final NotificationScreenParams arg;

  const NotificationScreen({super.key, required this.arg});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    widget.arg.notificationBloc.add(GetAllNotificationEvent(isReload: true));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    if (widget.arg.notificationBloc.state.isNew) {
      widget.arg.notificationBloc.add(GetMarkNotificationEvent());
    }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                CustomBackButtonIcon(),
                SizedBox(width: 8),
                Text(
                  LocaleKeys.notificationsNotifications.tr(),
                  style: context.headlineMedium(),
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocListener<NotificationBloc, NotificationState>(
              bloc: widget.arg.notificationBloc,
              listener: (context, state) {
                state.rejectExtraData.listenerFunction(
                  onSuccess: () {
                    widget.arg.notificationBloc.add(ResetRejectExtraEvent());
                  },
                  onFailed: () {
                    widget.arg.notificationBloc.add(ResetRejectExtraEvent());
                  },
                );
              },
              listenWhen: (pre, cur) =>
                  (pre.rejectExtraData.status != cur.rejectExtraData.status),
              child: BlocConsumer<NotificationBloc, NotificationState>(
                bloc: widget.arg.notificationBloc,
                builder: (context, state) {
                  return state.getAllNotification.builder(
                    successWidet: () {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.getAllNotification.listLength(2),
                        itemBuilder: (context, index) {
                          if (state.getAllNotification.length <= index) {
                            if (state.getAllNotification.length == index) {
                              widget.arg.notificationBloc.add(
                                GetAllNotificationEvent(),
                              );
                            }

                            return NotificationLoadingElement();
                          }

                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: NotificationListTileWidget(
                                  notificationModel:
                                      state.getAllNotification.list[index],

                                  notificationBloc: widget.arg.notificationBloc,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onTapRetry: () => widget.arg.notificationBloc.add(
                      GetAllNotificationEvent(isReload: true),
                    ),

                    // failedWidget: Stack(
                    //   children: [
                    //     // التوسيط الحقيقي
                    //     Center(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Image.asset(
                    //             Assets.images.png.emptyNotificationImage.path,
                    //             height: context.height * .1434,
                    //           ),
                    //           SizedBox(height: 24),
                    //           Text(
                    //             LocaleKeys.notificationsEmptyNotifications
                    //                 .tr(),
                    //             style: context.headlineMedium(
                    //               fontSize: 24,
                    //               fontFamily: "Nasaq",
                    //             ),
                    //           ),
                    //           SizedBox(height: 8),
                    //           Text(
                    //             state.getAllNotification.errorMessage,
                    //             style: context.bodySmall(fontSize: 14),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //
                    //     // الـ RefreshIndicator فوق الكل
                    //     RefreshIndicator(
                    //       onRefresh: () async {
                    //         widget.arg.notificationBloc.add(
                    //           GetAllNotificationEvent(isReload: true),
                    //         );
                    //       },
                    //       child: SingleChildScrollView(
                    //         physics: AlwaysScrollableScrollPhysics(),
                    //         child: Container(
                    //           height: context.height,
                    //         ), // مهم للسحب
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // emptyWidget: Stack(
                    //   children: [
                    //     // التوسيط الحقيقي
                    //     Center(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Image.asset(
                    //             Assets.images.png.emptyNotificationImage.path,
                    //             height: context.height * .1434,
                    //           ),
                    //           SizedBox(height: 24),
                    //           Text(
                    //             LocaleKeys.notificationsEmptyNotifications
                    //                 .tr(),
                    //             style: context.headlineMedium(
                    //               fontSize: 24,
                    //               fontFamily: "Nasaq",
                    //             ),
                    //           ),
                    //           SizedBox(height: 8),
                    //           Text(
                    //             LocaleKeys
                    //                 .notificationsNotificationsWillAppeared
                    //                 .tr(),
                    //             style: context.bodySmall(fontSize: 14),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //
                    //     // الـ RefreshIndicator فوق الكل
                    //     RefreshIndicator(
                    //       onRefresh: () async {
                    //         widget.arg.notificationBloc.add(
                    //           GetAllNotificationEvent(isReload: true),
                    //         );
                    //       },
                    //       child: SingleChildScrollView(
                    //         physics: AlwaysScrollableScrollPhysics(),
                    //         child: Container(
                    //           height: context.height,
                    //         ), // مهم للسحب
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    loadingWidget: NotificationLoadingWidget(),
                  );
                },
                listener: (context, state) {
                  state.confirmExtraData.listenerFunction(
                    onSuccess: () {
                      widget.arg.notificationBloc.add(ResetConfirmExtraEvent());
                    },
                    onFailed: () {
                      widget.arg.notificationBloc.add(ResetConfirmExtraEvent());
                    },
                  );
                },
                listenWhen: (pre, cur) =>
                    (pre.confirmExtraData.status !=
                    cur.confirmExtraData.status),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationScreenParams {
  final NotificationBloc notificationBloc;

  NotificationScreenParams({required this.notificationBloc});
}
