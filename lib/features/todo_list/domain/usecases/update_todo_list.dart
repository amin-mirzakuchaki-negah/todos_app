import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todos_app/core/error/failure.dart';
import 'package:todos_app/core/usecases/usecases.dart';

import '../entities/todo_list_entity.dart';

@lazySingleton
class UpdateTodo implements UseCase<List<TodoListEntity>, Params> {
  @override
  Future<Either<Failure, List<TodoListEntity>>> call(Params params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class Params extends Equatable {
 final TodoListEntity entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity];
}