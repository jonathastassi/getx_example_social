import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/errors/failures.dart';
import 'package:getx_example_social/domain/entities/post_entity.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<PostEntity>>> getPostsByUserId(int userId);
}