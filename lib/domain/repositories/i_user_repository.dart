import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/errors/failures.dart';
import 'package:getx_example_social/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<UserEntity>>> getList();
}