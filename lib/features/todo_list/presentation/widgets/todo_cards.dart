import 'package:flutter/material.dart';
import 'package:todos_app/core/util/extension.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';

class TodoCards extends StatelessWidget {
  final TodoListEntity item;
  final Function(TodoListEntity) onCheckedClick;
  const TodoCards({
    super.key,
    required this.item,
    required this.onCheckedClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[800],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  const SizedBox(width: 20),
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    item.category?.toStringValue ?? '-',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
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
}
