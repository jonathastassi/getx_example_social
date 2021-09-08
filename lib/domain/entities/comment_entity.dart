class CommentEntity {
  final int id;
  final String name;
  final String email;
  final String body;
  final int postId;

  CommentEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    required this.postId,
  });
}
