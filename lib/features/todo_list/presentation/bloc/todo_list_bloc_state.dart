part of 'todo_list_bloc.dart';

sealed class TodoListState extends Equatable {
  final List<TodoListEntity> items;

  const TodoListState({
    this.items = const [],
  });

  @override
  List<Object?> get props => [items];
}

final class TodoListInitialState extends TodoListState {}

class InputFailureState extends TodoListState {
  
  const InputFailureState({required super.items});
}

class TodoListLoadingState extends TodoListState {
  
  const TodoListLoadingState({required super.items});
}

class TodoListSuccessState extends TodoListState {
  const TodoListSuccessState({required super.items});
}

class TodoListCacheFailureState extends TodoListState {
  final String? message;

  const TodoListCacheFailureState([this.message]);

  @override
  List<Object?> get props => [message];
}
