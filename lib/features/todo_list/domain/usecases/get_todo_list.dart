import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/usecases/usecases.dart';
import 'package:todos_app/features/todo_list/domain/repositories/todo_list_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/todo_list.dart';

@lazySingleton
class GetTodoList implements UseCase<TodoList, NoParams> {
  final TodoListRepository todoListRepository;

  GetTodoList(this.todoListRepository);

  @override
  Future<Either<Failure, TodoList>> call(NoParams params) async {
    return await todoListRepository.getTodoList();
  }
}