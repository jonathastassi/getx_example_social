import 'package:getx_example_social/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required int id,
    required String name,
    required String body,
    required String email,
    required int postId,
  }) : super(
    id: id,
    name: name,
    body: body,
    email: email,
    postId: postId,
  );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      name: json['name'],
      body: json['body'],
      email: json['email'],
      postId: json['postId'],
    );
  }
}