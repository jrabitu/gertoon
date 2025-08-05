// lib/data/mock_categories.dart

import 'package:flutter/material.dart';
import 'package:gertoon/data/models/category_model.dart';
import 'package:gertoon/core/app_colors.dart';

final List<Category> mockCategories = [
  Category(title: 'Originals Rankings', icon: Icons.leaderboard, color: AppColors.accentDeep),
  Category(title: 'CANVAS Rankings', icon: Icons.group, color: AppColors.primaryVibrant),
  Category(title: 'New Releases', icon: Icons.fiber_new, color: AppColors.accentPastel),
  Category(title: 'Daily', icon: Icons.calendar_today, color: AppColors.primaryDeep),
  Category(title: 'Ability User', icon: Icons.psychology, color: Colors.blueGrey),
  Category(title: 'Action', icon: Icons.local_fire_department, color: Colors.red),
  Category(title: 'BL', icon: Icons.favorite, color: Colors.pink),
  Category(title: 'College Setting', icon: Icons.school, color: Colors.indigo),
  // Add more categories as needed
];