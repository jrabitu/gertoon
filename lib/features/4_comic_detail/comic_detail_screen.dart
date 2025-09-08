import 'package:flutter/material.dart';
import 'package:gertoon/core/app_colors.dart';
import 'package:gertoon/data/models/comic_model.dart';
import 'package:gertoon/data/mock_data.dart'; // For related manga
import 'package:gertoon/features/4_comic_detail/author_screen.dart';

class ComicDetailScreen extends StatelessWidget {
  final Comic comic;

  const ComicDetailScreen({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                comic.coverUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Share not implemented yet')));
                },
              ),
              IconButton(
                icon: const Icon(Icons.file_download_outlined, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Download not implemented yet')));
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comic.title,
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ファントムバスターズ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[300],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reading view not implemented yet')));
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.pink[200]!),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.play_arrow, color: Colors.pink, size: 16),
                                SizedBox(width: 4),
                                Text('Reading', style: TextStyle(color: Colors.pink)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Card(
                        color: Colors.grey[850],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Source: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Image.asset(
                                    'assets/flags/mb.png',
                                    height: 16,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 16),
                                  ),
                                  Text(' ${comic.source}', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Translation: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Image.asset(
                                    'assets/flags/uk.png',
                                    height: 16,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 16),
                                  ),
                                  Text(' ${comic.translation}', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Rating: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Row(
                                    children: List.generate(5, (index) => Icon(
                                      Icons.star,
                                      color: index < (comic.rating / 2).round() ? Colors.amber : Colors.grey,
                                      size: 16,
                                    )),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('State: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text(comic.state, style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Chapters: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text('${comic.currentChapter}/${comic.totalChapters} chapters (${comic.readingTime})', style: TextStyle(color: Colors.white)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: comic.totalChapters > 0 ? comic.currentChapter / comic.totalChapters : 0,
                                      backgroundColor: Colors.grey[700],
                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        comic.description,
                        style: TextStyle(fontSize: 16, color: Colors.grey[300]),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('More details not implemented yet')));
                        },
                        child: Text('More', style: TextStyle(color: Colors.pink)),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        children: comic.genres.map((genre) => ActionChip(
                          label: Text(genre),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Filter by $genre not implemented yet')));
                          },
                          backgroundColor: Colors.grey[800],
                          labelStyle: TextStyle(color: Colors.white),
                        )).toList(),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        color: Colors.grey[850],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text('Author ID: ${comic.authorId}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AuthorScreen(authorId: comic.authorId, liked: true)),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _showChapterList(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDeep,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.play_arrow, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Read Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Related manga', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Related manga list not implemented yet')));
                            },
                            child: Text('Show all', style: TextStyle(color: Colors.pink)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mockComics.where((c) => c.genres.any(comic.genres.contains)).take(4).length,
                          itemBuilder: (context, index) {
                            final related = mockComics.where((c) => c.genres.any(comic.genres.contains)).toList()[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(
                                related.coverUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(child: CircularProgressIndicator());
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showChapterList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Chapters',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: comic.totalChapters,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Chapter ${index + 1}'),
                          subtitle: Text('Released on ${comic.releaseDate.add(Duration(days: index * 7)).toString().split(' ')[0]}'),
                          trailing: const Icon(Icons.download),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reading chapter not implemented yet')));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}