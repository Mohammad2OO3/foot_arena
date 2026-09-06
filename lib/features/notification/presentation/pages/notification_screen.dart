import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:footarena/core/di/injection.dart';
import '../../../../common/design/src/widgets/custom_back_button_icon.dart';
import '../../../../common/design/src/widgets/my_custom_scaffold.dart';
import '../../../../common/extensions/src/context_extensions.dart';
import '../../../../common/helper/src/locale_keys.dart';
import '../bloc/notification_bloc.dart';
import '../widgets/notification_list_tile_widget.dart';
import '../widgets/notification_loading_widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late final NotificationBloc notificationBloc;

  @override
  void initState() {
    notificationBloc = getIt<NotificationBloc>()
      ..add(GetAllNotificationEvent(isReload: true));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    if (notificationBloc.state.isNew) {
      notificationBloc.add(GetMarkNotificationEvent());
    }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBar: AppBar(
        backgroundColor: context.primarySwatch,
        title:   Text(
          'Notifications',
          style: context.headlineMedium(
              color: Colors.white
          ),
        ),
        centerTitle: false,

      ),
      body: Column(
        children: [

          Expanded(
            child: BlocListener<NotificationBloc, NotificationState>(
              bloc: notificationBloc,
              listener: (context, state) {
                state.rejectExtraData.listenerFunction(
                  onSuccess: () {
                   notificationBloc.add(ResetRejectExtraEvent());
                  },
                  onFailed: () {
                    notificationBloc.add(ResetRejectExtraEvent());
                  },
                );
              },
              listenWhen: (pre, cur) =>
                  (pre.rejectExtraData.status != cur.rejectExtraData.status),
              child: BlocConsumer<NotificationBloc, NotificationState>(
                bloc: notificationBloc,
                builder: (context, state) {
                  return state.getAllNotification.builder(
                    successWidet: () {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.getAllNotification.listLength(2),
                        itemBuilder: (context, index) {
                          if (state.getAllNotification.length <= index) {
                            if (state.getAllNotification.length == index) {
                              notificationBloc.add(
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

                                  notificationBloc: notificationBloc,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onTapRetry: () => notificationBloc.add(
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
                      notificationBloc.add(ResetConfirmExtraEvent());
                    },
                    onFailed: () {
                      notificationBloc.add(ResetConfirmExtraEvent());
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
