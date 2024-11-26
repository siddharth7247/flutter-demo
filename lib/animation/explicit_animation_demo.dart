import 'package:flutter/material.dart';

class ExplicitAnimationDemo extends StatefulWidget {
  const ExplicitAnimationDemo({super.key});

  @override
  State<ExplicitAnimationDemo> createState() => _ExplicitAnimationDemoState();
}

class _ExplicitAnimationDemoState extends State<ExplicitAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(duration: const Duration(seconds: 2)),
    );
  }
}
