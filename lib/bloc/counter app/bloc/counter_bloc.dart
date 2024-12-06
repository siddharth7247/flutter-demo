import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>(Increment); 
    on<DecrementEvent>(Decrement);
    on<ShowSnakbarEvent>(ShowSnakbar);
    on<CurrentEvent>(CurrentValue);
  }

  int counter = 0;
  FutureOr<void> Increment(IncrementEvent event, Emitter<CounterState> emit) {
    counter = counter + 1;
    emit(UpdateValueState(value: counter));
  }



  FutureOr<void> Decrement(DecrementEvent event, Emitter<CounterState> emit) {
    counter = counter - 1;
    emit(UpdateValueState(value: counter));
  }

  FutureOr<void> ShowSnakbar(ShowSnakbarEvent event, Emitter<CounterState> emit) {
    emit(ShowSnakbarActionState());
  }

  FutureOr<void> CurrentValue(CurrentEvent event, Emitter<CounterState> emit) {
    emit(CurrentValueState(value: counter));
  }
}
