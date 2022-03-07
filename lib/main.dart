import 'package:custom_animate_custom_paint/pages/line_page.dart';
import 'package:flutter/material.dart';

import 'pages/circle_page.dart';

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
      home: CirclePage()
    );
  }
}

