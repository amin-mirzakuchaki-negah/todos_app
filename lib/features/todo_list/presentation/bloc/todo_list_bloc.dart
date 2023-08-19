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
import '../../domain/usecases/delete_todo_list.dart';

part 'todo_list_bloc_event.dart';
part 'todo_list_bloc_state.dart';

@injectable
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodoList _getTodoList;
  final AddTodoList _addTodoList;
  final UpdateTodoList _updateTodo;
  final DeleteTodoList _deleteTodo;

  TodoListBloc({
    required GetTodoList getTodoList,
    required AddTodoList addTodoList,
    required UpdateTodoList updateTodo,
    required DeleteTodoList deleteTodo,
  })  : _getTodoList = getTodoList,
        _addTodoList = addTodoList,
        _updateTodo = updateTodo,
        _deleteTodo = deleteTodo,
        super(const TodoListInitialState()) {
    //Initializing our bloc
    on<GetTodoListEvent>(_onGetTodoListEvent);
    on<AddTodoListEvent>(_onAddTodoListEvent, transformer: droppable());
    on<ToggleTodoListEvent>(_onToggleTodoEvent, transformer: droppable());
    on<DeleteTodoListEvent>(_onDeleteTodoListEvent, transformer: droppable());
    on<UpdateTodoListEvent>(_onUpdateListTodoEvent, transformer: droppable());
    on<InitialTodoListEvent>(_onInitialTodoListEvent);
  }

  Future<void> _onInitialTodoListEvent(
    InitialTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    emit(TodoListInitialState(items: state.items));
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

  Future<void> _onUpdateListTodoEvent(
    UpdateTodoListEvent event,
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

    final body = event.item.updateTodo(
      title: title,
      description: description,
      category: category,
    );
    final todo = await _updateTodo(UpdateParams(entity: body));
    final newState = await todo.fold(
      (failure) async => UpdateTodoListFailureState(),
      (updatedtodolist) async =>
          UpdateTodoListSuccessState(items: updatedtodolist),
    );
    emit(newState);
  }

  Future<void> _onDeleteTodoListEvent(
    DeleteTodoListEvent event,
    Emitter<TodoListState> emit,
  ) async {
    final body = event.item;
    final deletedTodo = await _deleteTodo(DeleteParams(entity: body));
    final newState = await deletedTodo.fold(
      (failure) async => DeleteTodoFailureState(items: state.items),
      (deletedtodolist) async => DeleteTodoSuccessState(items: deletedtodolist),
    );
    emit(newState);
  }
}
