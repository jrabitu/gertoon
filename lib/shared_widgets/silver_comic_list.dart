import 'package:flutter/material.dart';
import 'package:gertoon/data/models/comic_model.dart';
import 'package:gertoon/shared_widgets/comic_card.dart';

class SliverComicSection extends StatelessWidget {
  final String title;
  final List<Comic> comics;
  final double itemHeight;

  const SliverComicSection({
    super.key,
    required this.title,
    required this.comics,
    this.itemHeight = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: itemHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: comics.length,
                itemBuilder: (context, index) {
                  final comic = comics[index];
                  return ComicCard(comic: comic); // no onTap for now
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
