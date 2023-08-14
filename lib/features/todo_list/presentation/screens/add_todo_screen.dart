import 'package:flutter/material.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/todo_inputs.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingSymmetricValue = 15;

    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافه کردن انجام دادن',
            style: TextStyle(color: Colors.greenAccent)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 50, left: paddingSymmetricValue, right: paddingSymmetricValue),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                Text('تیتر', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 10),
            TodoInput(text: ' تیتر اضافه کنید', lineNumber: 1),
            const SizedBox(
              height: 35,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                Text('توضیحات', style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 10),
            TodoInput(text: 'توضیحات اضافه کنید', lineNumber: 9)
          ],
        ),
      ),
    );
  }
}
