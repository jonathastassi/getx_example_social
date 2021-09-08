import 'package:getx_example_social/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required int id,
    required String title,
    required String body,
    required int userId,
  }) : super(
          id: id,
          title: title,
          body: body,
          userId: userId,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
