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

  const TitleInputFailureState({required super.items});

}

class DescriptionInputFailureState extends TodoListState {

  const DescriptionInputFailureState({required super.items});

}

class CategoryInputFailureState extends TodoListState {

  const CategoryInputFailureState({required super.items});

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

  const AddTodoListToCacheFailureState({required super.items, this.message});

  @override
  List<Object?> get props => [message, items];
}
