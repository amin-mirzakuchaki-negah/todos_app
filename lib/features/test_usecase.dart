import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todos_app/core/error/errors.dart';
import 'package:todos_app/core/usecase/usecase.dart';

abstract class TestRepository {
  Future<Either<Failure, List<String>>> getTest({
    required int pageNumber,
    required int pageSize,
  });
}

class TestUseCase extends UseCase<List<String>, Params> {
  final TestRepository repository;

  const TestUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<String>>> call(Params params) =>
      repository.getTest(
        pageNumber: params.pageNumber,
        pageSize: params.pageSize,
      );
}

class Params extends NoParams {
  const Params({
    required this.pageNumber,
    required this.pageSize,
  });

  final int pageNumber;
  final int pageSize;

  @override
  List<Object?> get props => [pageNumber, pageSize];
}
