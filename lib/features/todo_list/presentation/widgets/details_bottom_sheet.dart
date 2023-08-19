import 'package:flutter/material.dart';
import 'package:todos_app/core/util/extension.dart';

import '../../domain/entities/todo_list_entity.dart';

class DetailsBottomSheet extends StatelessWidget {
  const DetailsBottomSheet({super.key, required this.item});

  final TodoListEntity item;

  final double _widthSize = 14;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.keyboard_arrow_down, size: 35),
                ),
              ),
              const Text('تیتر', style: TextStyle(fontSize: 18)),
              Text(item.title),
              const SizedBox(height: 15),
              const Text('توضیحات', style: TextStyle(fontSize: 18)),
             Text(item.description),
              const SizedBox(height: 20),
              const Text('دسته بندی'),
              Text(item.category!.toStringValue),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("تاریخ ساخت"),
                  SizedBox(width: _widthSize),
                  const Text('زمان ساخت'),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  Text(item.createdAt?.toDate(item.createdAt) ?? "-/-/-"),
                  SizedBox(width: _widthSize),
                  Text(item.createdAt?.toTime(item.createdAt) ?? "-/-/-"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("تاریخ بروزرسانی"),
                  SizedBox(width: _widthSize),
                  const Text('زمان بروزرسانی'),
                ],
              ),
              Row(
                children: [
                  Text(item.updatedAt?.toDate(item.updatedAt) ?? "-/-/-"),
                  SizedBox(width: _widthSize),
                  Text(item.updatedAt?.toTime(item.updatedAt) ?? "-/-/-"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
