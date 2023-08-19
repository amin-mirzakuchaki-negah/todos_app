import 'package:flutter/material.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({super.key, required this.onTapped, required this.isUpdated});

  final VoidCallback onTapped;

  final bool isUpdated;
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(isUpdated? "تیتر و توضیحات نباید خالی باشند": "'تیتر و توضیحات و دسته بندی نباید خالی باشند'"),
      content: ElevatedButton(onPressed: onTapped, child: const Text("متوجه شدم"))
    );
  }
}

