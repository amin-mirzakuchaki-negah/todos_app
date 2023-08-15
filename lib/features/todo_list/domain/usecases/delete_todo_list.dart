import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/error/failure.dart';

import '../../../../core/usecases/usecases.dart';
import '../repositories/todo_list_repository.dart';
import '../entities/todo_list_entity.dart';

@lazySingleton
class DeleteTodoList implements UseCase<List<TodoListEntity>, DeleteParams> {

  final TodoListRepository todoListRepository;

  DeleteTodoList({required this.todoListRepository});

  @override
  Future<Either<Failure, List<TodoListEntity>>> call(DeleteParams params) async {
    return await todoListRepository.deleteTodoList(params.entity);
  }
}

class DeleteParams extends Equatable {
  final TodoListEntity entity;

  const DeleteParams({required this.entity});

  @override
  List<Object?> get props => [entity];
}
