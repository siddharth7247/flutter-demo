import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/counter%20app/counter%20ui/counter_screen.dart';
import 'package:flutter_demo/bloc/crud_bloc/student_ui/add_student_screen.dart';

class BlocIndex extends StatelessWidget {
  const BlocIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ),
                );
              },
              child: const Text('Counter App'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddStudentScreen(),
                  ),
                );
              },
              child: const Text('Crud App'),
            ),
          ],
        ),
      ),
    );
  }
}
