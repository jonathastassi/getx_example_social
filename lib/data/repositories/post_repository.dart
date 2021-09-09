import 'package:getx_example_social/data/http/i_http_client.dart';
import 'package:getx_example_social/data/models/post_model.dart';
import 'package:getx_example_social/domain/entities/post_entity.dart';
import 'package:getx_example_social/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_example_social/domain/repositories/i_post_repository.dart';

class PostRepository implements IPostRepository {
  final IHttpClient httpClient;

  PostRepository({required this.httpClient});

  @override
  Future<Either<Failure, List<PostEntity>>> getPostsByUserId(int userId) async {
    try {
      final response = await httpClient
          .get('https://jsonplaceholder.typicode.com/users/$userId/posts');

      if (response.statusCode == 200) {
        final result = response.data as List;
        return Right(
          result.map((user) => PostModel.fromJson(user)).toList(),
        );
      }
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
