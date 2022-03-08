import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class LinePage extends StatelessWidget {
  const LinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lines"),
      ),
      drawer: DrawerWidget(),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // with offset
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);

    // with path
    /*
     var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
    */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
