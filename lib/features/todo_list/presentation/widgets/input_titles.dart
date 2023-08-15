import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  InputTitle({super.key, required this.text});

  final String text;

  final TextEditingController controller = TextEditingController();

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
