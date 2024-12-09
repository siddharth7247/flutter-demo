import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/counter%20app/bloc/counter_bloc.dart';
import 'package:flutter_demo/common_widgets/custom_snakbar.dart';

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
                      counterBloc.add(
                        IncrementEvent(),
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                BlocConsumer<CounterBloc, CounterState>(
                  bloc: counterBloc,
                  builder: (context, state) {
                    if (state is CounterInitial) {
                      return _counter(counterBloc.counter);
                    }
                    if (state is UpdateValueState) {
                      return _counter(state.value);
                    } else {
                      return _counter(counterBloc.counter);
                    }
                  },
                  listener: (BuildContext context, CounterState state) {
                    if (state is ShowSnakbarActionState) {
                      if (counterBloc.counter >= 10) {
                        Snakbar.show(context, "Reached Maximum Limit", false);
                      } else {
                        Snakbar.show(context, "Reached Minimum Limit", false);
                      }
                    }
                  },
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      counterBloc.add(
                        DecrementEvent(),
                      );
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
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
