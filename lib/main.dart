import 'package:custom_animate_custom_paint/pages/line_page.dart';
import 'package:flutter/material.dart';

import 'pages/circle_page.dart';
import 'pages/polygon_animated_page.dart';
import 'pages/polygon_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Animate',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/line',
      routes: {
        '/line': (context) => const LinePage(),
        '/circle': (context) => const CirclePage(),
        '/polygon': (context) => const PolygonPage(),
        '/polygon-animated': (context) => const PolygonAnimatedPage(),
      },
    );
  }
}
