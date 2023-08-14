import 'package:equatable/equatable.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:todos_app/core/util/enum.dart';

class TodoListEntity extends Equatable {
  final String title;
  final String description;
  final int id;
  final bool done;
  final Jalali? createdAt;
  final Jalali? updatedAt;
  final MyCategory? category;

  const TodoListEntity({
    required this.title,
    required this.description,
    required this.id,
    required this.done,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory TodoListEntity.create({
    required String title,
    required String description,
    required MyCategory category,
  }) =>
      TodoListEntity(
        title: title,
        description: description,
        done: false,
        createdAt: Jalali.now(),
        updatedAt: null,
        id: -1,
        category: category,
      );

  TodoListEntity copyWith({
    int? id,
    Jalali? updatedAt,
  }) =>
      TodoListEntity(
        title: title,
        description: description,
        id: id ?? this.id,
        done: done,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category,
      );

  TodoListEntity toggleDone() => TodoListEntity(
        title: title,
        description: description,
        id: id,
        done: !done,
        createdAt: createdAt,
        updatedAt: updatedAt,
        category: category,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        id,
        done,
        createdAt,
        updatedAt,
        category,
      ];
}
