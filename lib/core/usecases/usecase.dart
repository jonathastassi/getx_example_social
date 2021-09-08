import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/errors/failures.dart';

abstract class Usecase<TOut, TIn> {
  Future<Either<Failure, TOut>> call(TIn params);
}

class NoParams {

}