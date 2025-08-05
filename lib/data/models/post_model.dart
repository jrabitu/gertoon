// lib/data/models/post_model.dart

class Post {
  final String id;
  final String authorName;
  final String authorProfilePicUrl;
  final String content;
  final String? imageUrl; // Optional image
  final DateTime timestamp;

  Post({
    required this.id,
    required this.authorName,
    required this.authorProfilePicUrl,
    required this.content,
    this.imageUrl,
    required this.timestamp,
  });
}