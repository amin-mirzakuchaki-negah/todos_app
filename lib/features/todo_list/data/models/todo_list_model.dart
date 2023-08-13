import 'package:todos_app/core/util/extension.dart';

import '../../domain/entities/todo_list.dart';

class TodoListModel extends TodoList {
  const TodoListModel({
    required super.title,
    required super.description,
    required super.id,
    required super.done,
    required super.createdAt,
    required super.updatedAt,
    required super.category,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
        title: json['title'],
        description: json['description'],
        id:json ['id'],
        done: json['done'],
        category: (){
          final value = json['category'];
          if(value is! String) return null;
          return value.toCategory;
        }(),
        createdAt:  (){
          final value = json['createdAt'];
          if(value is! String) return null;
          return value.toJalali;
        }(),
        updatedAt: (){
          final value = json['updatedAt'];
          if(value is! String) return null;
          return value.toJalali;
        }(),
      );
}
