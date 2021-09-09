import 'package:getx_example_social/core/errors/failures.dart';
import 'package:getx_example_social/data/http/i_http_client.dart';
import 'package:getx_example_social/data/models/comment_model.dart';
import 'package:getx_example_social/domain/entities/comment_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_example_social/domain/repositories/i_comment_repository.dart';

class CommentRepository implements ICommentRepository {
  final IHttpClient httpClient;

  CommentRepository({required this.httpClient});

  @override
  Future<Either<Failure, List<CommentEntity>>> getListByPostId(
      int postId) async {
    try {
      final response = await httpClient
          .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');

      if (response.statusCode == 200) {
        final result = response.data as List;
        return Right(
          result.map((user) => CommentModel.fromJson(user)).toList(),
        );
      }
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
