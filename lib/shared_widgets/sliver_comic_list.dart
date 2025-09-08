import 'package:flutter/material.dart';
import 'package:gertoon/data/models/comic_model.dart';
import 'package:gertoon/shared_widgets/comic_card.dart';
import 'package:gertoon/features/4_comic_detail/comic_detail_screen.dart';


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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
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
                  //return ComicCard(comic: comic);
                  return GestureDetector(
                    onTap:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ComicDetailScreen(comic: comic)),
                      );
                    },
                  child: ComicCard(comic: comic),
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
