// lib/data/mock_posts.dart

import 'package:gertoon/data/models/post_model.dart';
import 'package:gertoon/data/mock_data.dart'; // We'll reuse our mock authors

List<Post> mockPosts = [
  Post(
    id: 'p1',
    authorName: mockAuthors[0].name,
    authorProfilePicUrl: mockAuthors[0].profileImageUrl,
    content: 'Just finished the latest chapter of "Struck by a Star"! It was so good!',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Post(
    id: 'p2',
    authorName: mockAuthors[1].name,
    authorProfilePicUrl: mockAuthors[1].profileImageUrl,
    content: 'This month\'s new fantasy comic releases are amazing. Any recommendations for what to read next?',
    timestamp: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  Post(
    id: 'p3',
    authorName: mockAuthors[2].name,
    authorProfilePicUrl: mockAuthors[2].profileImageUrl,
    content: 'Loving the artwork in "The Emperor and the Saint". The character designs are flawless.',
    imageUrl: 'https://picsum.photos/seed/post1/600/400',
    timestamp: DateTime.now().subtract(const Duration(hours: 8)),
  ),
  Post(
    id: 'p4',
    authorName: 'Jrabitu', // A user like you!
    authorProfilePicUrl: 'https://picsum.photos/seed/jrabitu/200/200',
    content: 'What\'s new?',
    timestamp: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  Post(
    id: 'p5',
    authorName: '5k8499', // A user from your screenshot
    authorProfilePicUrl: 'https://picsum.photos/seed/5k8499/200/200',
    content: '1 жилийн өмнөх mongoliin stream',
    imageUrl: 'https://picsum.photos/seed/post2/600/400',
    timestamp: DateTime.now().subtract(const Duration(hours: 6)),
  ),
  Post(
    id: 'p6',
    authorName: 'florfaund', // A user from your screenshot
    authorProfilePicUrl: 'https://picsum.photos/seed/florfaund/200/200',
    content: 'name:DQQPQ6',
    imageUrl: 'https://picsum.photos/seed/post3/600/400',
    timestamp: DateTime.now().subtract(const Duration(hours: 8)),
  ),
  // Add more mock posts here for a longer feed
];