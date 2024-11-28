import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (constraints.maxHeight < 900) ...[
              Container(
                height: constraints.maxHeight * 0.3,
                width: constraints.maxWidth * 0.7,
                color: Colors.deepPurple,
              )
            ] else if (constraints.maxHeight > 900 &&
                constraints.maxHeight < 1600) ...[
              Container(
                height: constraints.maxHeight * 0.7,
                width: constraints.maxWidth * 0.7,
                color: Colors.deepPurple,
              )
            ] else ...[
              Container(
                height: constraints.maxHeight * 0.7,
                width: constraints.maxWidth * 0.7,
                color: Colors.deepPurple,
              )
            ]
          ],
        );
      },
    );
  }
}
