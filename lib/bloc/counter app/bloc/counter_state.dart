part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class ShowSnakbarActionState extends CounterState{}

class UpdateValueState extends CounterState{
  final int value;
  UpdateValueState({required this.value});
}

