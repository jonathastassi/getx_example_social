import 'package:getx_example_social/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_example_social/core/usecases/usecase.dart';
import 'package:getx_example_social/domain/entities/user_entity.dart';
import 'package:getx_example_social/domain/repositories/i_user_repository.dart';

class GetUserList implements Usecase<List<UserEntity>, NoParams> {

  final IUserRepository userRepository;

  GetUserList({required this.userRepository,});

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) {
    return this.userRepository.getList();
  }
}