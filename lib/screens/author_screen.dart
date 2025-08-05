// lib/screens/author_screen.dart

import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/webtoon_card.dart';
import 'detail_screen.dart';

class AuthorScreen extends StatelessWidget {
  static const routeName = '/author';

  const AuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)!.settings.arguments as String;
    final info = authorInfo[name]!;
    final works = dummyWebtoons.where((w) => w.author == name).toList();

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(info['avatar']!),
            ),
            SizedBox(height: 12),
            Text(name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(info['bio']!, textAlign: TextAlign.center),
            SizedBox(height: 24),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Works by $name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 12),
            // reuse the same WebtoonCard, passing each work
            Column(
              children: works.map((wt) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: WebtoonCard(
                    webtoon: wt,
                    onTap: () => Navigator.pushNamed(
                      context,
                      DetailScreen.routeName,
                      arguments: wt,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
