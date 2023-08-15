import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class GetFromCacheFailure extends Failure {}
class AddToCacheFailure extends Failure {}
class UpdateTodoFailure extends Failure {}
