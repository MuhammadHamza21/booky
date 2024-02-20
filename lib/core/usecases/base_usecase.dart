import 'package:booky/core/error/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
