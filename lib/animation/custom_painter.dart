import 'dart:developer';

import 'package:flutter/material.dart';

class CustomPainterDemo extends StatefulWidget {
  const CustomPainterDemo({super.key});

  @override
  State<CustomPainterDemo> createState() => _CustomPainterState();
}

class _CustomPainterState extends State<CustomPainterDemo>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> navBarAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    navBarAnimation = Tween<Offset>(
            begin: const Offset(0, 650), end: const Offset(400, 650))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: navBarAnimation,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(size.width, 120),
                  painter: WavePainter(curveOffset: navBarAnimation.value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Offset curveOffset;

  WavePainter({super.repaint, required this.curveOffset});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.amberAccent
      ..strokeWidth = 1;
    Path path = Path()
      ..moveTo(0, 500)
      ..lineTo(0, 600)
      ..lineTo(400, 600)
      ..lineTo(400, 500)
      ..lineTo(230, 500)
      ..quadraticBezierTo(650 - curveOffset.dy, 570, curveOffset.dx + , 500)
      ..lineTo(0, 500);
    log("Offset dx = ${curveOffset.dx}");
    log("Offset dy = ${curveOffset.dy}");

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
