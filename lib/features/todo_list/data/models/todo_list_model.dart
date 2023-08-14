import 'package:shamsi_date/shamsi_date.dart';
import 'package:todos_app/core/util/extension.dart';

import '../../domain/entities/todo_list_entity.dart';

class TodoListModel extends TodoListEntity {
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
        id: json['id'],
        done: json['done'],
        category: () {
          final value = json['category'];
          if (value is! String) return null;
          return value.toCategory;
        }(),
        createdAt: () {
          final value = json['createdAt'];
          if (value is! String) return null;
          return value.toJalali;
        }(),
        updatedAt: () {
          final value = json['updatedAt'];
          if (value is! String) return null;
          return value.toJalali;
        }(),
      );
  @override
  TodoListModel copyWith({
    int? id,
    Jalali? updatedAt,
  }) =>
      TodoListModel(
        title: title,
        description: description,
        id: id ?? this.id,
        done: done,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category,
      );
  //converting entity to model
  factory TodoListModel.fromEntity(TodoListEntity entity) => TodoListModel(
        title: entity.title,
        description: entity.description,
        id: entity.id,
        done: entity.done,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        category: entity.category,
      );

  Map<String, dynamic> get toJson => {
        'title': title,
        'description': description,
        'id': id,
        'done': done,
        'category': category?.toValue,
        'createdAt': createdAt?.toValue,
        'updatedAt': updatedAt?.toValue,
      };
}
