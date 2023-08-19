import 'package:flutter/material.dart';
import 'package:todos_app/core/util/extension.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/title_category_text_style.dart';

class TodoCards extends StatelessWidget {
  final TodoListEntity item;
  final Function(TodoListEntity) onCheckedClick;
  final Function(TodoListEntity) deleteTodo;
  final Function(TodoListEntity, BuildContext) onCardTapped;
  final Function(TodoListEntity, BuildContext) navigateToUpdateScreen;
  const TodoCards({
    super.key,
    required this.item,
    required this.onCheckedClick,
    required this.deleteTodo,
    required this.onCardTapped,
    required this.navigateToUpdateScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF000000),
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: Colors.black.withOpacity(.2),
            offset: const Offset(0, 4),
          )
        ],
      ),
      height: 80,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => onCardTapped(item, context),
          onLongPress: () => navigateToUpdateScreen(item, context),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 6, bottom: 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //first line
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.blue,
                        value: item.done,
                        onChanged: (bool? value) => onCheckedClick(item),
                      ),
                      Text(
                          "${item.title} (${item.category?.toStringValue ?? '-'})",
                          style: textStyle()),
                      const Spacer(),
                      IconButton(
                          onPressed: () => deleteTodo(item),
                          icon: const Icon(Icons.delete),
                          splashColor: Colors.transparent),
                    ],
                  ),
                  //second line
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        item.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
