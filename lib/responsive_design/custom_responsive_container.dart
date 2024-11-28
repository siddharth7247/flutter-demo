import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_container.dart';

class CustomResponsiveContainer extends StatelessWidget {
  const CustomResponsiveContainer({super.key});

  @override
  Widget build(BuildContext text) {
    return const Scaffold(
      body: Center(
        child: CustomContainer(),
      ),
    );
  }
}