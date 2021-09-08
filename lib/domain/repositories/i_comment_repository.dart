import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/errors/failures.dart';
import 'package:getx_example_social/domain/entities/comment_entity.dart';

abstract class ICommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getListByPostId(int postId);
}