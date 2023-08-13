import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/error/exception.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/features/todo_list/data/datasource/todo_list_local_data_source.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list.dart';
import 'package:todos_app/features/todo_list/domain/repositories/todo_list_repository.dart';

@LazySingleton(as: TodoListRepository)
class TodoListRepositoryImpl implements TodoListRepository {

  final TodoListLocalDataSource todoListLocalDataSource;

  TodoListRepositoryImpl(this.todoListLocalDataSource);

  @override
  Future<Either<Failure, List<TodoListEntity>>> getTodoList() async {
    try {
      final localTodoList = await todoListLocalDataSource.getTodoList();
      return Right(localTodoList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}