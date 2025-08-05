// lib/data/dummy_data.dart
import '../models/webtoon.dart';

const rawDummy = [
  {
    "title": "Sora",
    "author": "titi",
    "thumbnail":
        "https://i.pinimg.com/1200x/93/60/f0/9360f0837fba8b75d49ce3e9f0bbb7b5.jpg",
    "rating": 4.8,
    "genre": "Fantasy",
  },
  {
    "title": "asa",
    "author": "mimi",
    "thumbnail":
        "https://i.pinimg.com/736x/d2/cf/34/d2cf34c1fcda6f430ca8bc503e52f029.jpg",
    "rating": 4.5
  },
  {
    "title": "hoshi",
    "author": "eti",
    "thumbnail":
        "https://i.pinimg.com/736x/cc/c3/a8/ccc3a834da37c37c3bd13fd3ab142114.jpg",
    "rating": 4.9
  },
];

final List<Webtoon> dummyWebtoons =
    rawDummy.map((json) => Webtoon.fromJson(json)).toList();

const authorInfo = {
  'titi': {
    'avatar': 'https://i.pinimg.com/736x/fc/70/fa/fc70fa77eb239492c43218c3af0991dd.jpg',
    'bio': 'Mongolian illustrator and storyteller creating fantasy worlds.',
  },
  'mimi': {
    'avatar': 'https://i.pinimg.com/736x/ed/f6/16/edf6162f41aa68b7c40c0291bdcf10c8.jpg',
    'bio': 'Fantasy writer and webtoon artist from Ulaanbaatar.',
  },
  'eti': {
    'avatar': 'https://i.pinimg.com/736x/53/41/41/534141065991e12e7d3785c8cff38320.jpg',
    'bio': 'Sci-fi and nature-inspired visual storyteller based in Mongolia.',
  },
};