// lib/screens/my_page_screen.dart
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/webtoon.dart';
import '../widgets/webtoon_card.dart';
import 'detail_screen.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // (high rating) and history (lower rating)
    final List<Webtoon> bookmarks =
        dummyWebtoons.where((w) => w.rating >= 4.5).toList();
    final List<Webtoon> history =
        dummyWebtoons.where((w) => w.rating < 4.5).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // Bookmarks section
            Text(
              'Bookmarks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: bookmarks.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (_, i) => WebtoonCard(
                  webtoon: bookmarks[i],
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: bookmarks[i],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // History section
            Text(
              'History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: history.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (_, i) => WebtoonCard(
                  webtoon: history[i],
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: history[i],
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
