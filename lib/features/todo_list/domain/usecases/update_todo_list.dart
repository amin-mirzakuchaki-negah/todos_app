import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/core/usecases/usecases.dart';

import '../entities/todo_list_entity.dart';
import '../repositories/todo_list_repository.dart';

@lazySingleton
class UpdateTodoList implements UseCase<List<TodoListEntity>, UpdateParams> {

  final TodoListRepository todoListRepository;

  UpdateTodoList({required this.todoListRepository});

  @override
  Future<Either<Failure, List<TodoListEntity>>> call(UpdateParams params) async {
    return await todoListRepository.updateTodoList(params.entity);
  }
}

class UpdateParams extends Equatable {
 final TodoListEntity? entity;

  const UpdateParams({required this.entity});

  @override
  List<Object?> get props => [entity];
}