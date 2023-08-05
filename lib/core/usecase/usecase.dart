import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todos_app/core/error/errors.dart';

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}

abstract class UseCase<T, P extends NoParams> {
  const UseCase();

  Future<Either<Failure, T>> call(P params);
}
