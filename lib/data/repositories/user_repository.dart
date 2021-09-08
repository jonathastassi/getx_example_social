import 'package:getx_example_social/data/http/i_http_client.dart';
import 'package:getx_example_social/data/models/user_model.dart';
import 'package:getx_example_social/domain/entities/user_entity.dart';
import 'package:getx_example_social/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_example_social/domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final IHttpClient httpClient;

  UserRepository({required this.httpClient});

  @override
  Future<Either<Failure, List<UserEntity>>> getList() async {
    try {
      final response =
          await httpClient.get('https://jsonplaceholder.typicode.com/users');


      if (response.statusCode == 200) {
        final result = response.data as List;
        return Right(result
            .map((user) => UserModel.fromJson(user))
            .toList());
      }
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
