import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';
import 'package:todos_app/features/todo_list/domain/usecases/get_todo_list.dart';
import 'package:todos_app/features/todo_list/domain/usecases/update_todo_list.dart';

import '../../../../core/usecases/usecases.dart';
import '../../../../core/util/enum.dart';
import '../../domain/usecases/add_todo_list.dart';

part 'todo_list_bloc_event.dart';
part 'todo_list_bloc_state.dart';

@injectable
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodoList _getTodoList;
  final AddTodoList _addTodoList;
  final UpdateTodo _updateTodo;

  TodoListBloc(
      {required GetTodoList getTodoList,
      required AddTodoList addTodoList,
      required UpdateTodo updateTodo})
      : _getTodoList = getTodoList,
        _addTodoList = addTodoList,
        _updateTodo = updateTodo,
        super(TodoListInitialState()) {
    //Initializing our bloc
    on<GetTodoListEvent>(_onGetTodoListEvent);
    on<AddTodoListEvent>(_onAddTodoListEvent, transformer: droppable());
    on<ToggleTodoListEvent>(_onToggleTodoEvent);
  }

  Future<void> _onGetTodoListEvent(
    GetTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    emit(TodoListLoadingState(items: state.items));
    final result = await _getTodoList(const NoParams());
    final newState = await result.fold(
      (failure) async => const GetTodoListFromCacheFailureState(),
      (todolist) async => GetTodoListSuccessState(items: todolist),
    );
    emit(newState);
  }

  Future<void> _onAddTodoListEvent(
    AddTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    final title = event.title;
    final description = event.description;
    final category = event.category;

    if (title.isEmpty) {
      emit(TitleInputFailureState(items: state.items));
      return;
    }

    if (description.isEmpty) {
      emit(DescriptionInputFailureState(items: state.items));
      return;
    }

    if (category == null) {
      emit(CategoryInputFailureState(items: state.items));
      return;
    }
    final body = TodoListEntity.create(
      title: title,
      description: description,
      category: category,
    );
    final todo = await _addTodoList(AddParams(entity: body));

    final newState = await todo.fold(
      (failure) async => AddTodoListToCacheFailureState(items: state.items),
      (todolist) async => AddTodoListSuccessState(items: todolist),
    );
    emit(newState);
  }

  Future<void> _onToggleTodoEvent(
    ToggleTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    final body = event.item.toggleDone();
    final todo = await _updateTodo(UpdateParams(entity: body));
    final newState = await todo.fold(
      (failure) async => ToggleTodoFailureState(items: state.items),
      (todolist) async => ToggleSuccessState(items: todolist),
    );
    emit(newState);
  }
}
