// lib/data/models/category_model.dart

import 'package:flutter/material.dart';

class Category {
  final String title;
  final IconData icon; // We'll use an icon for now, and a placeholder image
  final Color color;

  Category({
    required this.title,
    required this.icon,
    required this.color,
  });
}