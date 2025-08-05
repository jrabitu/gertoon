// lib/features/1_community/screen.dart

import 'package:flutter/material.dart';
import 'package:gertoon/data/mock_posts.dart'; // Import our mock post data
import 'package:gertoon/shared_widgets/post_card.dart'; // Import our new PostCard widget

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
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mockPosts.length,
        itemBuilder: (context, index) {
          final post = mockPosts[index];
          return PostCard(post: post);
        },
      ),
    );
  }
}