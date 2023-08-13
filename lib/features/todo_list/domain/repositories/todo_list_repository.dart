import '../../../../core/error/failure.dart';
import '../entities/todo_list.dart';
import 'package:dartz/dartz.dart';

abstract class TodoListRepository {
  Future<Either<Failure, List<TodoList>>> getTodoList();
  Future<Either<Failure, List<TodoList>>> addTodoList(TodoList todoList);
  Future<Either<Failure, List<TodoList>>> updateTodoList(TodoList todoList);
  Future<Either<Failure, List<TodoList>>> doneOrRedoTodoList(int id);
  Future<Either<Failure, List<TodoList>>> deleteOrRedoTodoList(int id);
}