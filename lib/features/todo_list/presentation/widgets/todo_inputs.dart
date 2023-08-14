import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoInput extends StatelessWidget {
  const TodoInput({super.key, required this.text, required this.lineNumber});

  final String text;
  final int lineNumber;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: text,
      ),
      minLines: lineNumber,
      maxLines: lineNumber,
    );
  }
}
