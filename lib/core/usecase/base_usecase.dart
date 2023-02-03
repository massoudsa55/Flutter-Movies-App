import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseUsecase<T> {
  Future<Either<Failure, T>> call();
}
