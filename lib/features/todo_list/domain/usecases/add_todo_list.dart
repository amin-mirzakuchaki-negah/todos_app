
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/todo_list_entity.dart';
import '../repositories/todo_list_repository.dart';

@lazySingleton
class AddTodoList implements UseCase<List<TodoListEntity>, AddParams> {
  final TodoListRepository todoListRepository;

  AddTodoList(this.todoListRepository);

  @override
  Future<Either<Failure, List<TodoListEntity>>> call(AddParams params) async {
    return await todoListRepository.addTodoList(params.entity);
  }
}

class AddParams extends Equatable {
 final TodoListEntity entity;

  const AddParams({required this.entity});

  @override
  List<Object?> get props => [entity];
}
