import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_example_social/domain/entities/post_entity.dart';
import 'package:getx_example_social/domain/repositories/i_comment_repository.dart';
import 'package:getx_example_social/domain/repositories/i_post_repository.dart';
import 'package:getx_example_social/domain/usecases/comment/get_comment_list_by_post.dart';
import 'package:getx_example_social/domain/usecases/post/get_post_list_by_user.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements IPostRepository {}

void main() {
  late IPostRepository postRepository;
  late GetPostListByUser getPostListByUser;

  setUp(() {
    postRepository = MockPostRepository();
    getPostListByUser = GetPostListByUser(
      postRepository: postRepository,
    );
  });

  test('Should return posts list from repository passing userId', () async {
    final userId = 123;
    final mockList = [
      PostEntity(id: 1, title: 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', body: 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto', userId: userId),          
      PostEntity(id: 2, title: 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', body: 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto', userId: userId),          
    ];

    when(() => postRepository.getPostsByUserId(userId)).thenAnswer((_) async => Right(mockList));

    final result = await getPostListByUser.call(GetPostListByUserParams(userId: userId));

    expect(result, Right(mockList));
    verify(() => postRepository.getPostsByUserId(userId)).called(1);
    verifyNoMoreInteractions(postRepository);
  });
}
