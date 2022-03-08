import 'package:flutter/material.dart';
import 'dart:math' as math;

class PolygonPage extends StatefulWidget {
  const PolygonPage({Key? key}) : super(key: key);

  @override
  State<PolygonPage> createState() => _PolygonPageState();
}

class _PolygonPageState extends State<PolygonPage> with TickerProviderStateMixin {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 4),
  );

  animation = _rotationTween.animate(controller)
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

  controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygons'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomPaint(
                painter: ShapePainter(_sides, _radius, animation.value),
                child: Container(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Sides'),
            ),
            Slider(
              value: _sides,
              min: 3.0,
              max: 10.0,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Size'),
            ),
            Slider(
              value: _radius,
              min: 10.0,
              max: MediaQuery.of(context).size.width / 2,
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Size'),
            ),
            Slider(
              value: _radians,
              min: 0.0,
              max: math.pi,
              onChanged: (value) {
                setState(() {
                  _radians = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  ShapePainter(this.sides, this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
