import 'package:flutter/material.dart';
import '../models/webtoon.dart';

class WebtoonCard extends StatelessWidget {
  final Webtoon webtoon;
  final VoidCallback onTap;

  const WebtoonCard({
    super.key,
    required this.webtoon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 0.65,
                child: Image.network(
                  webtoon.coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'by ${webtoon.author}',
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: List.generate(5, (i) {
                  return Icon(
                    i < webtoon.rating.round()
                        ? Icons.star
                        : Icons.star_border,
                    size: 12,
                    color: Colors.amber,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
