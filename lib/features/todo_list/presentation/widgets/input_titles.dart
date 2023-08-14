import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTitle extends StatelessWidget {
  const  InputTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        Text(text, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
