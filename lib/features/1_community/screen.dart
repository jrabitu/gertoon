// lib/features/1_community/screen.dart
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Stories
            SizedBox(
              height: 90,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey.shade300,
                        child: Text('A${i + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 6),
                      Text('A${i + 1}',
                          style: const TextStyle(fontSize: 12)),
                    ],
                  );
                },
              ),
            ),

            // Filters
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  _FilterChip(label: 'All', selected: true),
                  const SizedBox(width: 8),
                  _FilterChip(label: 'Following'),
                  const SizedBox(width: 8),
                  _FilterChip(label: 'Trending'),
                ],
              ),
            ),

            // Posts
            _PostCard(
              author: 'Author Name',
              handle: '@author',
              time: '1h',
              text: 'New series launches Friday! 📚 Preview below.',
              previewTitle: 'Moonlight Kiss',
              previewSubtitle: '★ 4.9 • Romance',
              likes: 120,
              comments: 18,
            ),
            _PostCard(
              author: 'Another Author',
              handle: '@author2',
              time: '4h',
              text:
                  'Thank you for reading the latest chapter — your support means the world 💖',
              likes: 89,
              comments: 12,
            ),
            _PostCard(
              author: 'Studio K',
              handle: '@studiok',
              time: '6h',
              text: 'Sketching tomorrow’s panel. Here’s a WIP shot ✍️\nTeaser tomorrow 9PM!',
              likes: 42,
              comments: 6,
            ),
            // Add more posts as needed...

            const SizedBox(height: 24),

            // Footer
            Column(
              children: [
                const Divider(),
                const SizedBox(height: 12),
                const Text('© 2025 Gertoon. All rights reserved.',
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
                const SizedBox(height: 4),
                const Text('Terms of Service | Privacy Policy',
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
                const SizedBox(height: 4),
                const Text('Contact: support@gertoon.com',
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  child: const Text('Load more'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* ===================
 * Small widgets
 * =================== */

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {},
      selectedColor: Colors.blue.shade100,
    );
  }
}

class _PostCard extends StatelessWidget {
  final String author;
  final String handle;
  final String time;
  final String text;
  final String? previewTitle;
  final String? previewSubtitle;
  final int likes;
  final int comments;

  const _PostCard({
    required this.author,
    required this.handle,
    required this.time,
    required this.text,
    this.previewTitle,
    this.previewSubtitle,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Row(
                children: [
                  const CircleAvatar(radius: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(author,
                            style: t.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        Text('$handle • $time',
                            style:
                                t.bodySmall?.copyWith(color: Colors.black54)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(text),
              if (previewTitle != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(previewTitle!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      if (previewSubtitle != null)
                        Text(previewSubtitle!,
                            style: const TextStyle(color: Colors.black54)),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('View Comic'),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.favorite_border, size: 18, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text('$likes Likes', style: t.bodySmall),
                  const SizedBox(width: 16),
                  Icon(Icons.comment_outlined, size: 18, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text('$comments Comments', style: t.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
