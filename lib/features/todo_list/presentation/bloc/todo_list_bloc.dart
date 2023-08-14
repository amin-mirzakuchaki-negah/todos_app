import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';
import 'package:todos_app/features/todo_list/domain/usecases/get_todo_list.dart';

import '../../../../core/usecases/usecases.dart';
import '../../domain/usecases/add_todo_list.dart';

part 'todo_list_bloc_event.dart';
part 'todo_list_bloc_state.dart';

@injectable
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodoList _getTodoList;
  final AddTodoList _addTodoList;

  TodoListBloc({required GetTodoList getTodoList, required AddTodoList addTodoList})
      : _getTodoList = getTodoList,
        _addTodoList = addTodoList,
        super(TodoListInitialState()) {
    //Initializing our bloc
    on<GetTodoListEvent>(_onGetTodoListEvent);
    on<AddTodoListEvent>(_onAddTodoListEvent);
  }

  Future<void> _onGetTodoListEvent(
    GetTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    emit(TodoListLoadingState(items: state.items));
    final result = await _getTodoList(const NoParams());
    final newState = await result.fold(
      (failure) async=> const TodoListCacheFailureState(),
      (todolist) async=> GetTodoListSuccessState(items: todolist),
    );
    emit(newState);
  }

  Future<void> _onAddTodoListEvent(
    AddTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    emit(TodoListLoadingState(items: state.items));
    final result = await _getTodoList(const NoParams());
    final newState = await result.fold(
      (failure) async=> const TodoListCacheFailureState(),
      (todolist) async=> GetTodoListSuccessState(items: todolist),
    );
    emit(newState);
  }
}
