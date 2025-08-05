import 'package:flutter/material.dart';

class ReaderScreen extends StatelessWidget {
  const ReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of panel images
    final List<String> panels = [
      "https://via.placeholder.com/400x600.png?text=Panel+1",
      "https://via.placeholder.com/400x600.png?text=Panel+2",
      "https://via.placeholder.com/400x600.png?text=Panel+3",
      "https://via.placeholder.com/400x600.png?text=Panel+4",
      "https://via.placeholder.com/400x600.png?text=Panel+5",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapter 1"),
      ),
      body: ListView.builder(
        itemCount: panels.length,
        itemBuilder: (context, index) {
          return Image.network(
            panels[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
