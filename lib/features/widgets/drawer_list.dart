import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  final String text;
  final IconData icon;
  const DrawerList({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
