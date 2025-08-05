// lib/data/models/author_model.dart

class Author {
  final String id;
  final String name;
  final String profileImageUrl;
  final String bio;

  Author({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    this.bio = 'No bio available.',
  });
}