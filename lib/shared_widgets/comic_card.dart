import 'package:flutter/material.dart';
import 'package:gertoon/data/models/comic_model.dart';

class ComicCard extends StatelessWidget{
  final Comic comic;
  const ComicCard({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              comic.coverUrl,
              width: 140,
              height: 180,
              fit: BoxFit.cover,
              // Error handling for image loading
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50);
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            comic.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          // add a rating widget here later
          Text(
            'Rating: ${comic.rating}',
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}



