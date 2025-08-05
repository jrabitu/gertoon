// lib/features/4_my_shelf/screen.dart

import 'package:flutter/material.dart';

class MyShelfScreen extends StatelessWidget {
  const MyShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Reading, Finished, Custom
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Shelf'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Reading'),
              Tab(text: 'Finished'),
              Tab(text: 'Custom'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Continue reading list')),
            Center(child: Text('Finished reading list')),
            Center(child: Text('Custom shelves list')),
          ],
        ),
      ),
    );
  }
}