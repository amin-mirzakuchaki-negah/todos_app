import '../../../../core/error/failure.dart';
import '../entities/todo_list.dart';
import 'package:dartz/dartz.dart';

abstract class TodoListRepository {
  Future<Either<Failure, List<TodoListEntity>>> getTodoList();
  // Future<Either<Failure, List<TodoListEntity>>> addTodoList(TodoListEntity todoList);
  // Future<Either<Failure, List<TodoListEntity>>> updateTodoList(TodoListEntity todoList);
  // Future<Either<Failure, List<TodoListEntity>>> doneOrRedoTodoList(int id);
  // Future<Either<Failure, List<TodoListEntity>>> deleteOrRedoTodoList(int id);
}