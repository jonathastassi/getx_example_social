import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_example_social/core/usecases/usecase.dart';
import 'package:getx_example_social/domain/entities/user_entity.dart';
import 'package:getx_example_social/domain/repositories/i_user_repository.dart';
import 'package:getx_example_social/domain/usecases/user/get_user_list.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {

  late IUserRepository userRepository;
  late GetUserList getUserList;

  setUp(() {
    userRepository = MockUserRepository();
    getUserList = GetUserList(userRepository: userRepository);
  });

  test('Should call getList from repository and return data', () async {
    final mockList = [
      UserEntity(id: 1, name: 'Leanne Graham', email: 'Sincere@april.biz'),
      UserEntity(id: 2, name: 'Ervin Howell', email: 'Shanna@melissa.tv'),
      UserEntity(id: 3, name: 'Clementine Bauch', email: 'Nathan@yesenia.net'),
    ];

    when(() => userRepository.getList()).thenAnswer((_) async => Right(mockList));

    final result = await getUserList.call(NoParams());

    expect(result, Right(mockList));
    verify(() => userRepository.getList()).called(1);
    verifyNoMoreInteractions(userRepository);
  });
}