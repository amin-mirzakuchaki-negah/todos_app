import 'package:flutter/material.dart';
import 'package:todos_app/core/util/extension.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/todo_cards.dart';


// ignore: must_be_immutable
class TodoDisplay extends StatefulWidget {
  TodoDisplay({
    super.key,
    required this.todos,
  });

  List<dynamic> todos;

  @override
  State<TodoDisplay> createState() => _TodoDisplayState();
}

class _TodoDisplayState extends State<TodoDisplay> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          var todoList = _todoListModelToList();
          return TodoCards(
            title: '${todoList[index][0]}',
            description: '${todoList[index][1]}',
            category: '${todoList[index][6].toString().toFarsiString}',
          );
        },
      ),
    );
  }

  List<List<dynamic>> _todoListModelToList() {
    List<List<dynamic>> extractedValues = widget.todos.map((todo) {
      return [
        todo.title,
        todo.description,
        todo.id,
        todo.done,
        todo.createdAt,
        todo.updatedAt,
        todo.category,
      ];
    }).toList();
    return extractedValues;
  }

  convertingCategory() {}

}
