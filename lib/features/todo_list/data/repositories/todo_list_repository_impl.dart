import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/error/exception.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/features/todo_list/data/datasource/todo_list_local_data_source.dart';
import 'package:todos_app/features/todo_list/data/models/todo_list_model.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';
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
    } on GetFromCacheException {
      return Left(GetFromCacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<TodoListEntity>>> addTodoList(TodoListEntity todoList) async {
    try {

      final body = TodoListModel.fromEntity(todoList);
      final items = await todoListLocalDataSource.addTodoList(body);
      return Right(items);
    }
    on AddToCacheException {
      return Left(AddToCacheFailure());
    }
  }
}
