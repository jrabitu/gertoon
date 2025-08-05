// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/webtoon.dart';
import 'author_screen.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Webtoon webtoon = ModalRoute.of(context)!.settings.arguments as Webtoon;

    return Scaffold(
      appBar: AppBar(
        title: Text(webtoon.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Cover Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              webtoon.coverUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          // Title and Rating
          Text(
            webtoon.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: List.generate(5, (i) {
              final filled = i < webtoon.rating;
              return Icon(
                filled ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                size: 16,
              );
            }),
          ),
          SizedBox(height: 8),
          // Author
          Text(
            'By ${webtoon.author}',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 16),
          ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AuthorScreen.routeName,
              arguments: webtoon.author, 
            );
          },
            child: Text('View Author'),
          ),

          SizedBox(height: 24),
          // Chapters List
          Text(
            'Chapters',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...webtoon.chapters.map((chap) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(chap.title),
              trailing: Icon(
                chap.isLocked ? FontAwesomeIcons.lock : FontAwesomeIcons.unlock,
                size: 16,
              ),
              onTap: chap.isLocked ? null : () {
                // possible next thing to do: Open chapter content
              },
            );
          }),
        ],
      ),
    );
  }
}
