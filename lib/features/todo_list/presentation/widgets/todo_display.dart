import 'package:flutter/material.dart';

import '../../domain/entities/todo_list_entity.dart';
import 'todo_cards.dart';

class TodoDisplay extends StatelessWidget {
  final List<TodoListEntity> todos;
  final Function(TodoListEntity item) onCheckClick;
  final Function(TodoListEntity item) deleteTodo;
  final Function(TodoListEntity item, BuildContext context) onCardTapped;
  final Function(TodoListEntity, BuildContext) navigateToUpdateScreen;
  const TodoDisplay({
    super.key,
    required this.todos,
    required this.onCheckClick,
    required this.deleteTodo,
    required this.onCardTapped,
    required this.navigateToUpdateScreen,
  });

  @override
  Widget build(BuildContext context) {
    final reversedItems = todos.reversed;
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => TodoCards(
            item: reversedItems.toList()[index],
            onCheckedClick: onCheckClick,
            deleteTodo: deleteTodo,
            onCardTapped: onCardTapped,
            navigateToUpdateScreen: navigateToUpdateScreen,
          ),
      ),
    );
  }
}
