import 'package:flutter/material.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/enum_list_row.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/input_titles.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTodo();
          },
          child: Icon(Icons.done)),
      body: Padding(
        padding: EdgeInsets.only(
            top: 50, left: paddingSymmetricValue, right: paddingSymmetricValue),
        child: Column(
          children: [
            InputTitle(text: 'تیتر'),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              onChanged: (value){},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'تیتر اضافه کنید',
              ),
              minLines: 1,
              maxLines: 1,
            ),
            const SizedBox(height: 35),
            InputTitle(text: 'توضیحات'),
            const SizedBox(height: 10),
             TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'توضیحات اضافه کنید',
              ),
              minLines: 9,
              maxLines: 9,
            ),
            const SizedBox(height: 10),
            InputTitle(text: 'دسته بندی ها'),
            // Row
            EnumListRow(),
          ],
        ),
      ),
    );
  }

  addTodo() {}
}
