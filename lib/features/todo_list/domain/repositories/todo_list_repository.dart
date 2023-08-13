import '../../../../core/error/failure.dart';
import '../entities/todo_list.dart';
import 'package:dartz/dartz.dart';

abstract class TodoListRepository {
  Future<Either<Failure, TodoList>> getTodoList();
  Future<Either<Failure, TodoList>> addTodoList();
  Future<Either<Failure, TodoList>> updateTodoList();
  Future<Either<Failure, TodoList>> doneOrRedoTodoList();
  Future<Either<Failure, TodoList>> deleteOrRedoTodoList();
}