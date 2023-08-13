import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_list_bloc_event.dart';
part 'todo_list_bloc_state.dart';

class TodoListBlocBloc extends Bloc<TodoListBlocEvent, TodoListBlocState> {
  TodoListBlocBloc() : super(TodoListBlocInitial()) {
    on<TodoListBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
