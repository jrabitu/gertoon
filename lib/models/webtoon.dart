// lib/models/webtoon.dart
class Webtoon {
  final String title;
  final String author;
  final String coverUrl;
  final double rating;
  final List<Chapter> chapters;

  Webtoon({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.rating,
    required this.chapters,
  });

  factory Webtoon.fromJson(Map<String, dynamic> m) {
    return Webtoon(
      title: m['title'],
      author: m['author'],
      coverUrl: m['thumbnail'],                    
      rating: (m['rating'] as num).toDouble(),     
      chapters: List.generate(
        5,                                        
        (i) => Chapter(
          title: 'Episode ${i + 1}',
          isLocked: i.isOdd,                      
        ),
      ),
    );
  }
}

class Chapter {
  final String title;
  final bool isLocked;
  Chapter({required this.title, this.isLocked = false});
}
