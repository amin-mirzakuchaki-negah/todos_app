import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:todos_app/core/util/extension.dart';

import '../../domain/entities/todo_list_entity.dart';

class DetailsTodoScreen extends StatelessWidget {
  const DetailsTodoScreen({super.key, required this.item});

  final TodoListEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.title,
          style: TextStyle(color: Colors.greenAccent),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('توضیحات', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item.description),
                ],
              ),
              const SizedBox(height: 50),
              const Text('دسته بندی'),
              Text(item.category!.toStringValue),
              const SizedBox(height: 100),
              const Row(
                children: [
                  Text("تاریخ ساخت"),
                  Spacer(),
                  Text('زمان ساخت'),
                ],
              ),
              Row(
                children: [
                  Text(jalaliToDate(item.createdAt)),
                  const Spacer(),
                  Text(jalaliToTime(item.createdAt)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String jalaliToDate(Jalali? jalali) {
    int year = jalali!.year; // Extracts 1402
    int month = jalali.month; // Extracts 5
    int day = jalali.day;
    return "$year/$month/$day";
  }

  String jalaliToTime(Jalali? jalali) {
    int hour = jalali!.hour;
    int minute = jalali.minute;
    return "$hour:$minute";
  }
}
