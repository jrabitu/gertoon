import 'package:flutter/material.dart';
import 'package:gertoon/core/app_colors.dart';

class AuthorScreen extends StatelessWidget {
  final String authorId;
  final bool liked;

  const AuthorScreen({super.key, required this.authorId, required this.liked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Author ID: $authorId', style: TextStyle(color: Colors.white))),
      backgroundColor: Colors.grey[900],
      body: liked
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore Author $authorId\'s Works', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.facebook, color: AppColors.primaryDeep),
                    title: Text('Facebook', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // TODO: Open Facebook link
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: AppColors.primaryDeep), // Placeholder for Instagram
                    title: Text('Instagram', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // TODO: Open Instagram link
                    },
                  ),
                ],
              ),
            )
          : Center(child: Text('Like the comic to explore Author $authorId\'s profile!', style: TextStyle(color: Colors.white))),
    );
  }
}