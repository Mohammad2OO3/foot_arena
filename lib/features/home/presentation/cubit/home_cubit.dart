import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/locale_keys.dart';
import '../../../../core/notification/notification_navigator.dart';
import '../pages/home_screen.dart';

part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());



  void changeIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void changeFile(File? file) {
    emit(state.copyWith(file: file));
  }

  void deleteFile() {
    emit(state.copyWith(file: null)); // Reset the file to null
  }


  void setPendingNotification(Map<String, dynamic> data) {
    emit(state.copyWith(pendingNotificationData: data));
  }

  void clearPendingNotification() {
    emit(state.copyWith(pendingNotificationData: null));
  }

  void processPendingNotification() {
    final data = state.pendingNotificationData;

    if (data == null) return;

    try {
      NotificationNavigator.navigateFromData(data);
    } finally {
      clearPendingNotification();
    }
  }



}
