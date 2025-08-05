// lib/screens/recommendation_screen.dart
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/webtoon.dart';
import '../widgets/webtoon_card.dart';
import 'detail_screen.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // sort by rating descending
    final List<Webtoon> sorted = List<Webtoon>.from(dummyWebtoons)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    final List<Webtoon> trending = sorted.take(5).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending section
            Text(
              'Trending',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (_, i) => WebtoonCard(
                  webtoon: trending[i],
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: trending[i],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Recommendations grid
            Text(
              'All Recommendations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: sorted.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (_, i) => WebtoonCard(
                  webtoon: sorted[i],
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: sorted[i],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
