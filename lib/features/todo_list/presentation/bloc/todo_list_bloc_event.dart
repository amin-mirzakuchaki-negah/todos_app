part of 'todo_list_bloc.dart';

sealed class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class GetTodoListEvent extends TodoListEvent {}

class AddTodoListEvent extends TodoListEvent {
  final String title;
  final String description;
  final MyCategory category;

  const AddTodoListEvent({required this.title,required this.description,required this.category});
}
