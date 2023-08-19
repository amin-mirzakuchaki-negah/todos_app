import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/core/util/extension.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';
import 'package:todos_app/features/todo_list/presentation/screens/add_or_update_todo_screen.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/details_bottom_sheet.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/title_category_text_style.dart';

import '../bloc/todo_list_bloc.dart';

class TodoCards extends StatelessWidget {
  final TodoListEntity item;
  final Function(TodoListEntity) onCheckedClick;
  final Function(TodoListEntity) deleteTodo;
  const TodoCards({
    super.key,
    required this.item,
    required this.onCheckedClick,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCardTaped(context),
      onLongPress: () {
        Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_context) => MultiBlocProvider(
          providers: [
            BlocProvider<TodoListBloc>.value(
              value: context.read<TodoListBloc>(),
            ),
          ],
          child:  AddOrUpdateTodoScreen(isUpdated: true, item: item),
        ),
      ),
    );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        padding: const EdgeInsetsDirectional.only(end: 6, bottom: 8),
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
                  Text("${item.title} (${item.category?.toStringValue ?? '-'})",
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
    );
  }

  void onCardTaped(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return DetailsBottomSheet(item: item);
        });
  }
}
