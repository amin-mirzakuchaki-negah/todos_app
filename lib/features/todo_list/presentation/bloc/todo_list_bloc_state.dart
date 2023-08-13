part of 'todo_list_bloc.dart';

sealed class TodoListState extends Equatable {
  const TodoListState();
  
  @override
  List<Object?> get props => [];
}

final class TodoListInitial extends TodoListState {}

class InputFailureState extends TodoListState {}

class TodoListLoadingState extends TodoListState {}

class TodoListSuccessState extends TodoListState {
  final List<TodoListEntity> todoListEntity;

  const TodoListSuccessState({required this.todoListEntity});
}

class TodoListCacheFailureState extends TodoListState {
  final String? message;

  const TodoListCacheFailureState([this.message]);

  @override
  List<Object?> get props => [message];
}
