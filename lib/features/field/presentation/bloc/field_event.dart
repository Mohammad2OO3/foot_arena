part of 'field_bloc.dart';

@immutable
sealed class FieldEvent {}

class GetAllFieldEvent extends FieldEvent{}
class GetFieldDetailsEvent extends FieldEvent{
  final int id;

  GetFieldDetailsEvent({required this.id});

}
class GetAllSlotEvent extends FieldEvent{
  final GetAllFieldSlotParams params;

  GetAllSlotEvent({required this.params});
}
