import 'package:flutter/material.dart';

class CustomPaintViewScreen extends StatelessWidget {
  const CustomPaintViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: FlutterPainting(),
        ),
      ),
    );
  }
}

class FlutterPainting extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size.height);
    print(size.width);
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50.0, paint);
    Path path = Path();
    path.moveTo(0, size.height);

    path.lineTo(0, 720);
    path.quadraticBezierTo(50, 650, 120, 720);
    path.quadraticBezierTo(170, 780, 210, 720);
    path.quadraticBezierTo(260, 650, 320, 720);
    path.quadraticBezierTo(350, 780, size.width, 720);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
