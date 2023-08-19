import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/usecases/usecases.dart';
import 'package:todos_app/features/todo_list/domain/repositories/todo_list_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/todo_list_entity.dart';

@lazySingleton
class GetTodoList implements UseCase<List<TodoListEntity>, NoParams> {
  final TodoListRepository todoListRepository;

 const GetTodoList(this.todoListRepository);

  @override
  Future<Either<Failure, List<TodoListEntity>>> call(NoParams params) => todoListRepository.getTodoList();
}
