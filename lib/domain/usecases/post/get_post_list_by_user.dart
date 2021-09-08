import 'package:getx_example_social/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/usecases/usecase.dart';
import 'package:getx_example_social/domain/entities/post_entity.dart';
import 'package:getx_example_social/domain/repositories/i_post_repository.dart';

class GetPostListByUser
    implements Usecase<List<PostEntity>, GetPostListByUserParams> {
  final IPostRepository postRepository;

  GetPostListByUser({
    required this.postRepository,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> call(GetPostListByUserParams params) {
    return postRepository.getPostsByUserId(params.userId);
  }
}

class GetPostListByUserParams {
  final int userId;

  GetPostListByUserParams({
    required this.userId,
  });
}
