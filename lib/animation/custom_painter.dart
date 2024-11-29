import 'package:flutter/material.dart';

class CustomPainterDemo extends StatefulWidget {
  const CustomPainterDemo({super.key});

  @override
  State<CustomPainterDemo> createState() => _CustomPainterState();
}

class _CustomPainterState extends State<CustomPainterDemo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(

        children: [
          Center(
            child: CustomPaint(
              size: Size(size.width, 120),
              painter: HeartPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class HeartPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.amber,BlendMode.color);

    //drawing circal
    Paint circalPainter = Paint()..color = Colors.green;
    canvas.drawCircle(const Offset(300, 300), 30, circalPainter);
  
    var path = Path();
    var navbarPaint = Paint()..color = Colors.red..strokeWidth = 15;

    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    path.moveTo(0, 50);
    path.lineTo(size.width * 0.4, 50);
    path.quadraticBezierTo(size.width * 0.5, 150, size.width * 0.6, 50);
    path.lineTo(size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}

