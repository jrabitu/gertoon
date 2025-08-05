// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/dummy_data.dart';
import '../models/webtoon.dart';
import '../widgets/webtoon_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // complete list and picks
    final List<Webtoon> allWebtoons = dummyWebtoons;
    final List<Webtoon> picks = allWebtoons.where((w) => w.rating >= 4.8).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gertoon'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            // TODO: add more items
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today’s Picks
            Text(
              'Today’s Picks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: picks.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (_, i) => WebtoonCard(
                  webtoon: picks[i],
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: picks[i],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // All Webtoons
            Text(
              'All Webtoons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: allWebtoons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (_, i) => WebtoonCard(
                  webtoon: allWebtoons[i],
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: allWebtoons[i],
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
