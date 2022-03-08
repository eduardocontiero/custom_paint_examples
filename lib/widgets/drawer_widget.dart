import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(child:SafeArea(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          
          ListTile(
            title: const Text('Line Paint'),
            onTap: () {
            Navigator.of(context).pushReplacementNamed('/line');
            },
          ),
          ListTile(
            title: const Text('Circle Paint'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/circle');
            },
          ),
           ListTile(
            title: const Text('Polygon Paint'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/polygon');
            },
          ),
           ListTile(
            title: const Text('Polygon Animated Paint'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/polygon-animated');
            },
          ),
        ],
      ),
    ));
  }
}
