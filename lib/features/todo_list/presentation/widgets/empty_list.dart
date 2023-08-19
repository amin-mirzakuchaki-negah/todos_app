import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'چیزی برای نمایش وجود ندارد!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
