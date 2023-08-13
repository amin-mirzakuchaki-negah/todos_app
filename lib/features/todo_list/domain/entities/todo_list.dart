import 'package:equatable/equatable.dart';
import 'package:shamsi_date/shamsi_date.dart';

class TodoList extends Equatable {
  final String title;
  final String description;
  final int id;
  final bool done;
  final Jalali date;
  final Jalali updatedAt;

  const TodoList({
    required this.title,
    required this.description,
    required this.id,
    required this.done,
    required this.date,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [title, description, id, done, date, updatedAt];
}
