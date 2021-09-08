import 'package:getx_example_social/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/usecases/usecase.dart';
import 'package:getx_example_social/domain/entities/comment_entity.dart';
import 'package:getx_example_social/domain/repositories/i_comment_repository.dart';

class GetCommentListByPost
    implements Usecase<List<CommentEntity>, GetCommentListByPostParams> {
  final ICommentRepository commentRepository;

  GetCommentListByPost({
    required this.commentRepository,
  });

  @override
  Future<Either<Failure, List<CommentEntity>>> call(GetCommentListByPostParams params) {
    return commentRepository.getListByPostId(params.postId);
  }
}

class GetCommentListByPostParams {
  final int postId;

  GetCommentListByPostParams({
    required this.postId,
  });
}
