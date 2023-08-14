import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyFloatingActionButton extends StatelessWidget {
  MyFloatingActionButton({super.key, required this.function, required this.icon});

  final function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: Icon(icon),
    );
  }
}
