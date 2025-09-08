// lib/data/models/comic_model.dart
class Comic {
  final String id;
  final String title;
  final String authorId;
  final String coverUrl;
  final List<String> genres;
  final double rating;
  final String description;
  final int totalChapters;
  final int currentChapter;
  final bool isNew;
  final String state;          // e.g., "Ongoing"
  final String readingTime;    // e.g., "1 h 13 m"
  final String source;         // e.g., "MangaBuddy"
  final String translation;
  final DateTime releaseDate;  // first release or last chapter date

  // NEW
  final String format;         // 'Webtoon' | 'Manga' | 'Book'

  // (Optional, only if you want richer rankings later)
  final DateTime? updatedAt;   // last-chapter date
  final int favorites;
  final int views30d;

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
    required this.state,
    required this.readingTime,
    required this.source,
    required this.translation,
    required this.releaseDate,

    // NEW
    required this.format,
    this.updatedAt,
    this.favorites = 0,
    this.views30d = 0,
  });
}
