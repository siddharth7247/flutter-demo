part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

abstract class CounterActionState extends CounterState{}

class ShowSnakbarActionState extends CounterActionState{}

class UpdateValueState extends CounterState{
  final int value;
  UpdateValueState({required this.value});
}

class CurrentValueState extends CounterState{
  final int value;
  CurrentValueState({required this.value});
}
