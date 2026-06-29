class Post {
  final String name;
  final String content;
  final int likes;
  final int comments;
  final bool isLiked;

  Post({
    required this.name,
    required this.content,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });

  Post copyWith({
    String? name,
    String? content,
    int? likes,
    int? comments,
    bool? isLiked,
  }) {
    return Post(
      name: name ?? this.name,
      content: content ?? this.content,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}