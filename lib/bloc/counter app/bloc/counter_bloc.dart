import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>(Increment);
    on<DecrementEvent>(Decrement);
  }

  int counter = 0;
  FutureOr<void> Increment(IncrementEvent event, Emitter<CounterState> emit) {
    if (counter >= 10) {
      emit(
        ShowSnakbarActionState(),
      );
    } else {
      counter = counter + 1;
      emit(
        UpdateValueState(value: counter),
      );
    }
  }

  FutureOr<void> Decrement(DecrementEvent event, Emitter<CounterState> emit) {
    if (counter <= 0) {
      emit(
        ShowSnakbarActionState(),
      );
    } else {
      counter = counter - 1;
      emit(
        UpdateValueState(value: counter),
      );
    }
  }
}
