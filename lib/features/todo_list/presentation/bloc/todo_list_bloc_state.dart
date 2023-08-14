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

class TitleInputFailureState extends TodoListState {
  
  // const TitleInputFailureState({required super.items});

  final String? message;

  const TitleInputFailureState([this.message]);

  @override
  List<Object?> get props => [message];
}

class DescriptionInputFailureState extends TodoListState {
  
  // const DescriptionInputFailureState({required super.items});

  final String? message;

  const DescriptionInputFailureState([this.message]);

  @override
  List<Object?> get props => [message];
}

class TodoListLoadingState extends TodoListState {
  
  const TodoListLoadingState({required super.items});
}

class GetTodoListSuccessState extends TodoListState {
  const GetTodoListSuccessState({required super.items});
}

class AddTodoListSuccessState extends TodoListState {
  const AddTodoListSuccessState({required super.items});
}

class GetTodoListFromCacheFailureState extends TodoListState {
  final String? message;

  const GetTodoListFromCacheFailureState([this.message]);

  @override
  List<Object?> get props => [message];
}

class AddTodoListToCacheFailureState extends TodoListState {
  final String? message;

  const AddTodoListToCacheFailureState([this.message]);

  @override
  List<Object?> get props => [message];
}
