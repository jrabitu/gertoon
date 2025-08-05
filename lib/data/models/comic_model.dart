// lib/data/models/comic_model.dart

class Comic {
  final String id;
  final String title;
  final String authorId; // We will use the author's ID to link to the Author model
  final String coverUrl;
  final List<String> genres;
  final double rating;
  final String description;
  final int totalChapters;
  final int currentChapter;
  final bool isNew;

  Comic({
    required this.id,
    required this.title,
    required this.authorId,
    required this.coverUrl,
    required this.genres,
    required this.rating,
    required this.description,
    this.totalChapters = 0,
    this.currentChapter = 0,
    this.isNew = false,
  });
}