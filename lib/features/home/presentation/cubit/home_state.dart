part of 'home_cubit.dart';


class HomeState {
  final int selectedIndex;
  final Map<String, dynamic>? pendingNotificationData;


  HomeState({
    this.selectedIndex = 0,
    this.pendingNotificationData,


  });

  HomeState copyWith({
    int? selectedIndex,
    File? file, // Use nullable explicitly
    bool resetFile = false,
    Map<String, dynamic>? pendingNotificationData,


    // Add this flag for file reset
  })
  {
    return HomeState(// Use flag to reset the file to null
      selectedIndex: selectedIndex ?? this.selectedIndex,
      pendingNotificationData:
      pendingNotificationData ?? this.pendingNotificationData,
    );
  }



}
