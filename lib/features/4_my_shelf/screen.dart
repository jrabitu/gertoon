// lib/features/4_my_shelf/screen.dart

import 'package:flutter/material.dart';

class MyShelfScreen extends StatelessWidget {
  const MyShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Reading • Later • Completed • Saved Lists
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Shelf'),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz_rounded),
              onPressed: () {},
              tooltip: 'More',
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Reading'),
              Tab(text: 'Later'),
              Tab(text: 'Completed'),
              Tab(text: 'Saved Lists'),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              _ReadingTab(),
              _LaterTab(),
              _CompletedTab(),
              _SavedListsTab(),
            ],
          ),
        ),
      ),
    );
  }
}

/* ======================
 * Reading tab (main)
 * ====================== */
class _ReadingTab extends StatelessWidget {
  const _ReadingTab();

  @override
  Widget build(BuildContext context) {
    final items = <_ReadingItem>[
      _ReadingItem(
        title: 'Moonlight Kiss',
        chapter: 54,
        lastRead: '3 days ago',
        progress: 0.75,
      ),
      _ReadingItem(
        title: 'Crimson Tide',
        chapter: 12,
        lastRead: 'Yesterday',
        progress: 0.30,
      ),
      _ReadingItem(
        title: 'Winter Garden',
        chapter: 3,
        lastRead: '2 weeks ago',
        progress: 0.07,
      ),
    ];

    return CustomScrollView(
      slivers: [
        // Sort / Filter chips
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: _ChipButton(
                    label: 'Sort: Recently read',
                    icon: Icons.sort_rounded,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ChipButton(
                    label: 'Filter • Downloads',
                    icon: Icons.filter_list_rounded,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),

        // "Continue reading" header
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Continue reading',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        ),

        // Reading cards
        SliverList.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _ReadingCard(item: items[index]),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),

        // Saved for later section
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Text(
              'Saved for later',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 160,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 3,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 24),
            child: Text(
              'Swipe to the “Later” tab to see all →',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReadingItem {
  final String title;
  final int chapter;
  final String lastRead;
  final double progress; // 0..1
  const _ReadingItem({
    required this.title,
    required this.chapter,
    required this.lastRead,
    required this.progress,
  });
}

class _ReadingCard extends StatelessWidget {
  const _ReadingCard({required this.item});
  final _ReadingItem item;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.15)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // thumbnail
          Container(
            width: 120,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),
          // info + actions
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title + menu
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: t.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _CircleIconButton(
                      icon: Icons.more_horiz_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Ch. ${item.chapter} • ${item.lastRead}',
                  style: t.bodySmall?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: item.progress.clamp(0, 1),
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Details'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ======================
 * Later tab (placeholder)
 * ====================== */
class _LaterTab extends StatelessWidget {
  const _LaterTab();

  @override
  Widget build(BuildContext context) {
    // Simple grid preview of saved items
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.66,
      ),
      itemBuilder: (_, __) => Container(
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.06),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

/* =========================
 * Completed tab (cards)
 * ========================= */
class _CompletedTab extends StatelessWidget {
  const _CompletedTab();

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('Starry Nights', 4.7),
      ('After School', 4.6),
    ];
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) {
        final (title, rating) = items[i];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.withOpacity(0.15)),
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 6),
                    Text('Finished • ★ $rating',
                        style:
                            const TextStyle(color: Colors.black54, fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/* =========================
 * Saved Lists tab (simple)
 * ========================= */
class _SavedListsTab extends StatelessWidget {
  const _SavedListsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _ListTileCard(
          icon: Icons.favorite_outline,
          title: 'Top Romance Picks',
        ),
        SizedBox(height: 12),
        _ListTileCard(
          icon: Icons.sports_martial_arts_outlined,
          title: 'Action Essentials',
        ),
      ],
    );
  }
}

/* =========================
 * Small reusable widgets
 * ========================= */

class _ChipButton extends StatelessWidget {
  const _ChipButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12.withOpacity(0.06),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: Colors.black87),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12.withOpacity(0.06),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Icon(Icons.more_horiz_rounded, size: 18),
        ),
      ),
    );
  }
}

class _ListTileCard extends StatelessWidget {
  const _ListTileCard({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.15)),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {},
      ),
    );
  }
}
