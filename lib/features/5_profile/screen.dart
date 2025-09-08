// lib/features/5_profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:gertoon/core/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: const Text('My Profile'),
              centerTitle: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.view_list_rounded),
                  onPressed: () {},
                  tooltip: 'Menu',
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () {},
                  tooltip: 'Settings',
                ),
              ],
            ),

            // Header card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: _ProfileHeaderCard(),
              ),
            ),

            // Balance
            SliverToBoxAdapter(
              child: _Section(
                title: 'Balance',
                child: _BalanceCard(
                  coins: 1240,
                  onBuy: () {},
                  onTopUp: () {},
                ),
              ),
            ),

            // Quick actions (grid)
            SliverToBoxAdapter(
              child: _Section(
                title: 'Quick actions',
                child: _QuickActionsGrid(
                  items: const [
                    _QuickActionItem(
                      title: 'Shop',
                      subtitle: 'Coins • Bundles • Passes',
                      icon: Icons.store_mall_directory_outlined,
                    ),
                    _QuickActionItem(
                      title: 'Purchases',
                      subtitle: 'History & receipts',
                      icon: Icons.receipt_long_outlined,
                    ),
                    _QuickActionItem(
                      title: 'Subscriptions',
                      subtitle: 'Premium / auto-renew',
                      icon: Icons.auto_awesome_outlined,
                    ),
                    _QuickActionItem(
                      title: 'Gift Center',
                      subtitle: 'Send coins/passes',
                      icon: Icons.card_giftcard_outlined,
                    ),
                  ],
                ),
              ),
            ),

            // Stats & badges
            SliverToBoxAdapter(
              child: _Section(
                title: 'Stats & badges',
                child: Column(
                  children: const [
                    _ReadingStreakCard(days: 7, progress: 0.7),
                    SizedBox(height: 12),
                    _AchievementsCard(
                      text: 'Completed 10 series • 100 chapters read',
                    ),
                  ],
                ),
              ),
            ),

            // Library shortcuts
            SliverToBoxAdapter(
              child: _Section(
                title: 'Library shortcuts',
                child: _ListCard(
                  tiles: [
                    _ListItem(
                      icon: Icons.bookmarks_outlined,
                      title: 'Open My Shelf',
                      onTap: () {},
                    ),
                    _ListItem(
                      icon: Icons.playlist_add_outlined,
                      title: 'Saved Lists (Playlists)',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // Account & app
            SliverToBoxAdapter(
              child: _Section(
                title: 'Account & app',
                child: _ListCard(
                  tiles: [
                    _ListItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    _ListItem(
                      icon: Icons.help_outline,
                      title: 'Help & support',
                      onTap: () {},
                    ),
                    _ListItem(
                      icon: Icons.info_outline,
                      title: 'About / Terms',
                      onTap: () {},
                    ),
                    _ListItem(
                      icon: Icons.logout,
                      title: 'Log out',
                      isDestructive: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}

/* =========================
 *  Header & Section widgets
 * ========================= */

class _ProfileHeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentDeep.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.accentDeep.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: avatar + name + ID + member since
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFE6ECFF),
                child: Icon(Icons.person, color: AppColors.accentDeep, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Display Name',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(height: 4),
                    Text(
                      'ID: 7584•••838 • Member since 2025',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              // Tiny action chips could go here if needed
            ],
          ),
          const SizedBox(height: 12),

          // Buttons (Edit / Share)
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    side: BorderSide(color: AppColors.accentDeep.withOpacity(0.6)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Edit profile'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Colors.black.withOpacity(0.04),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Share'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Followers / Following
          Text(
            'Followers 1 • Following 12',
            style: textTheme.bodySmall?.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

/* ================
 *  Balance card
 * ================ */

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.coins,
    required this.onBuy,
    required this.onTopUp,
  });

  final int coins;
  final VoidCallback onBuy;
  final VoidCallback onTopUp;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(context),
      child: Row(
        children: [
          // Coin label
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coins', style: t.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('Balance: ${_fmt(coins)}', style: t.bodyMedium?.copyWith(color: Colors.black54)),
              ],
            ),
          ),
          // Actions
          FilledButton(
            onPressed: onBuy,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.accentDeep,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text('Buy'),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: onTopUp,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text('Top up'),
          ),
        ],
      ),
    );
  }

  String _fmt(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final j = s.length - i;
      buf.write(s[i]);
      if (j > 1 && j % 3 == 1) buf.write(',');
    }
    return buf.toString();
  }
}

/* ======================
 *  Quick actions (grid)
 * ====================== */

class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid({required this.items});
  final List<_QuickActionItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 110,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (_, i) => _QuickActionCard(item: items[i]),
    );
  }
}

class _QuickActionItem {
  final String title;
  final String subtitle;
  final IconData icon;
  const _QuickActionItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({required this.item});
  final _QuickActionItem item;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, color: AppColors.accentDeep),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: t.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(item.subtitle,
                    style: t.bodySmall?.copyWith(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================
 *  Stats & Achievements
 * =================== */

class _ReadingStreakCard extends StatelessWidget {
  const _ReadingStreakCard({required this.days, required this.progress});
  final int days;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reading streak', style: t.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              color: AppColors.accentDeep,
            ),
          ),
          const SizedBox(height: 6),
          Text('$days days', style: t.bodySmall?.copyWith(color: Colors.black54)),
        ],
      ),
    );
  }
}

class _AchievementsCard extends StatelessWidget {
  const _AchievementsCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(context),
      child: Row(
        children: [
          const Icon(Icons.emoji_events_outlined, color: AppColors.accentDeep),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: t.bodyMedium),
          ),
        ],
      ),
    );
  }
}

/* ======================
 *  Lists (library, account)
 * ====================== */

class _ListCard extends StatelessWidget {
  const _ListCard({required this.tiles});
  final List<_ListItem> tiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(context),
      child: Column(
        children: [
          for (int i = 0; i < tiles.length; i++) ...[
            ListTile(
              leading: Icon(
                tiles[i].icon,
                color: tiles[i].isDestructive ? Colors.red : AppColors.accentDeep,
              ),
              title: Text(
                tiles[i].title,
                style: tiles[i].isDestructive
                    ? const TextStyle(color: Colors.red)
                    : null,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: tiles[i].onTap,
            ),
            if (i != tiles.length - 1)
              Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
          ],
        ],
      ),
    );
  }
}

class _ListItem {
  final IconData icon;
  final String title;
  final bool isDestructive;
  final VoidCallback onTap;
  const _ListItem({
    required this.icon,
    required this.title,
    this.isDestructive = false,
    required this.onTap,
  });
}

/* ==============
 *  Helpers
 * ============== */

BoxDecoration _cardDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey.withOpacity(0.15)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );
}
