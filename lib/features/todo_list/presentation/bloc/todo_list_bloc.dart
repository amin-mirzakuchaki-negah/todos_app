import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list.dart';
import 'package:todos_app/features/todo_list/domain/usecases/get_todo_list.dart';

import '../../../../core/usecases/usecases.dart';

part 'todo_list_bloc_event.dart';
part 'todo_list_bloc_state.dart';

@injectable
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodoList _getTodoList;

  TodoListBloc({required GetTodoList getTodoList})
      : _getTodoList = getTodoList,
        super(TodoListInitialState()) {
    //Initializing our bloc
    on<GetTodoListEvent>(_onGetTodoListEvent);
  }

  Future<void> _onGetTodoListEvent(
    GetTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    emit(TodoListLoadingState());
    final result = await _getTodoList(const NoParams());
    final newState = await result.fold(
      (failure) async=> const TodoListCacheFailureState(),
      (todolist) async=> TodoListSuccessState(todoListEntity: todolist),
    );
    emit(newState);
  }
}
