import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent, width: 1.5),
      ),
    );
  }
}
