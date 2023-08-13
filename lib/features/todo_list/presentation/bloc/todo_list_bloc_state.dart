part of 'todo_list_bloc_bloc.dart';

sealed class TodoListBlocState extends Equatable {
  const TodoListBlocState();
  
  @override
  List<Object> get props => [];
}

final class TodoListBlocInitial extends TodoListBlocState {}
