part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementEvent extends CounterEvent{}

class DecrementEvent extends CounterEvent{}

class CurrentEvent extends CounterEvent{}

class ShowSnakbarEvent extends CounterEvent{}