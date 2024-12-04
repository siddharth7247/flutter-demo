import 'dart:ui' as ui;
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
        super.initState();


    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    navBarAnimation = Tween<Offset>(
            begin: const Offset(0, 500), end: const Offset(500, 800))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
            debugPrint("width ${MediaQuery.of(context).size.width}");

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Painter"),
        backgroundColor: Colors.amberAccent,
      ),
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
    canvas.drawColor(Colors.blueAccent, ui.BlendMode.color);
    // Path path = Path()
    //   ..moveTo(0, 750)
    //   ..lineTo(0, 850)
    //   ..lineTo(500, 800)
    //   ..lineTo(500, 750)
    //   ..lineTo(240, 750)
    //   ..quadraticBezierTo(200, 820, 150, 750)
    //   ..lineTo(0, 750);
    Path path = Path()
      ..moveTo(0, 750)
      ..lineTo(0, 850)
      ..lineTo(500, 850)
      ..lineTo(500, 750)
      ..lineTo(266, 750)
      ..quadraticBezierTo(245, 755, 230, 775)
      ..quadraticBezierTo(206, 805, 180, 775)
      ..quadraticBezierTo(166,755, 136, 750)
      ..lineTo(0, 750);

/// [working code]
      // ..quadraticBezierTo(245, 755, 230, 775)
      // ..quadraticBezierTo(206, 805, 180, 775)
      // ..quadraticBezierTo(166,755, 136, 750)

    canvas.drawPath(path, paint);
    canvas.drawCircle(
        curveOffset, 30, Paint()..color = Colors.green);

    const iconAdd = Icons.add;
    var builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontFamily: iconAdd.fontFamily,
        fontSize: 40,
      ),
    )..addText(String.fromCharCode(iconAdd.codePoint));
    var para = builder.build();
    para.layout(const ui.ParagraphConstraints(width: 5000));
    canvas.drawParagraph(para, const Offset(186, 720));

    const iconHome = Icons.home;
    builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontFamily: iconHome.fontFamily,
        fontSize: 40,
      ),
    )..addText(String.fromCharCode(iconHome.codePoint));
    para = builder.build();
    para.layout(const ui.ParagraphConstraints(width: 5000));
    canvas.drawParagraph(para, const Offset(60, 750));

    const iconCart = Icons.card_travel;
    builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontFamily: iconCart.fontFamily,
        fontSize: 40,
      ),
    )..addText(String.fromCharCode(iconCart.codePoint));
    para = builder.build();
    para.layout(const ui.ParagraphConstraints(width: 5000));
    canvas.drawParagraph(para, const Offset(300, 750));

    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
    );
    const homeTextSpan = TextSpan(
      text: 'home',
      style: textStyle,
    );
    final homePainter = TextPainter(
      text: homeTextSpan,
      textDirection: TextDirection.ltr,
    );
    homePainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    homePainter.paint(canvas, const Offset(60, 785));

    const purchesTextSpan = TextSpan(
      text: 'purches',
      style: textStyle,
    );
    final purchesPainter = TextPainter(
      text: purchesTextSpan,
      textDirection: TextDirection.ltr,
    );
    purchesPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    purchesPainter.paint(canvas, const Offset(295, 785));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
