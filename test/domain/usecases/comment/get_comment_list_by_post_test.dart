import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_example_social/domain/entities/comment_entity.dart';
import 'package:getx_example_social/domain/repositories/i_comment_repository.dart';
import 'package:getx_example_social/domain/usecases/comment/get_comment_list_by_post.dart';
import 'package:mocktail/mocktail.dart';

class MockCommentRepository extends Mock implements ICommentRepository {}

void main() {
  late ICommentRepository commentRepository;
  late GetCommentListByPost getCommentListByPost;

  setUp(() {
    commentRepository = MockCommentRepository();
    getCommentListByPost = GetCommentListByPost(
      commentRepository: commentRepository,
    );
  });

  test('Should return comment list from repository passing postId', () async {
    final postId = 123;
    final mockList = [
      CommentEntity(
          id: 1,
          name: 'id labore ex et quam laborum',
          email: 'Jayne_Kuhic@sydney.com',
          body:
              'est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et',
          postId: postId)
    ];

    when(() => commentRepository.getListByPostId(postId)).thenAnswer((_) async => Right(mockList));

    final result = await getCommentListByPost.call(GetCommentListByPostParams(postId: postId));

    expect(result, Right(mockList));
    verify(() => commentRepository.getListByPostId(postId)).called(1);
    verifyNoMoreInteractions(commentRepository);
  });
}
