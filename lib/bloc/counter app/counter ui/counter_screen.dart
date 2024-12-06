import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/counter%20app/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter app"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      if (counterBloc.counter >= 10) {
                        counterBloc.add(ShowSnakbarEvent());
                        counterBloc.add(CurrentEvent());
                      } else {
                        counterBloc.add(IncrementEvent());
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  bloc: counterBloc,
                  builder: (context, state) {
                    if (state is CounterInitial) {
                      return _counter(counterBloc.counter);
                    }
                    if (state is UpdateValueState) {
                      return _counter(state.value);
                    }
                    if(state is CurrentValueState){
                      return _counter(state.value);
                    }
                    return Container();
                  },
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      if (counterBloc.counter <= 0) {
                        counterBloc.add(ShowSnakbarEvent());
                        counterBloc.add(CurrentEvent());
                      } else {
                        counterBloc.add(DecrementEvent());
                      }
                    },
                    icon: const Icon(Icons.minimize),
                  ),
                ),
              ],
            ),
            BlocListener<CounterBloc, CounterState>(
              bloc: counterBloc,
              listener: (context, state) {
                if (state is ShowSnakbarActionState) {
                  if (counterBloc.counter >= 10) {
                    Snakbar.show(context, "Reached Maximum Limit", true);
                  } else {
                    Snakbar.show(context, "Reached Minimum Limit", false);
                  }
                }
              },
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}

Widget _counter(int counter) {
  return Center(
    child: Text(
      counter.toString(),
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  );
}

class Snakbar {
  final String message;
  final bool isError;
  Snakbar({required this.message, required this.isError});
  static show(BuildContext context, String message, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade400 : Colors.green.shade400,
      ),
    );
  }
}
