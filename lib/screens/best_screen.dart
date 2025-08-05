// lib/screens/best_screen.dart
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/webtoon.dart';
import '../widgets/webtoon_card.dart';
import 'detail_screen.dart';

class BestScreen extends StatelessWidget {
  const BestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // sort by rating descending
    final List<Webtoon> sorted = List<Webtoon>.from(dummyWebtoons)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    // take top 8 for best
    final List<Webtoon> bestList = sorted.take(8).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Best'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Rated',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: bestList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (_, index) {
                  final webtoon = bestList[index];
                  return WebtoonCard(
                    webtoon: webtoon,
                    onTap: () => Navigator.pushNamed(
                      context,
                      DetailScreen.routeName,
                      arguments: webtoon,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}