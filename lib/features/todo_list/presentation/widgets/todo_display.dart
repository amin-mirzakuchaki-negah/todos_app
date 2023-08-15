import 'package:flutter/material.dart';

import '../../domain/entities/todo_list_entity.dart';
import 'todo_cards.dart';

class TodoDisplay extends StatelessWidget {
  final List<TodoListEntity> todos;
  final Function(TodoListEntity item) onCheckClick;
  const TodoDisplay({
    super.key,
    required this.todos,
    required this.onCheckClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => TodoCards(
            item: todos[index],
            onCheckedClick: onCheckClick,
          ),
      ),
    );
  }
}
