// lib/features/3_home/screen.dart

import 'package:flutter/material.dart';
import 'package:gertoon/core/app_colors.dart';
import 'package:gertoon/data/mock_data.dart';
import 'package:gertoon/data/models/comic_model.dart';
import 'package:gertoon/shared_widgets/sliver_comic_list.dart';
import 'package:gertoon/features/4_comic_detail/comic_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  String _selectedFeed = 'Comic'; // Default selected feed

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Filter pool based on selected category
    List<Comic> pool;
    switch (_selectedFeed) {
      case 'Comic':
        pool = mockComics.where((c) => c.format == 'Comic').toList();
        break;
      case 'Manga':
        pool = mockComics.where((c) => c.format == 'Manga').toList();
        break;
      case 'Novel':
        pool = mockComics.where((c) => c.format == 'Novel').toList();
        break;
      default:
        pool = mockComics;
        break;
    }

    final List<Comic> sliderComics = pool.take(5).toList();
    final List<Comic> mainListComics = pool; // main list = filtered list


    //genre hesgiig array uusgeh
    final List<String> genres = ['Romance', 'Action', 'Fantasy', 'Horror', 'Sci-Fi', 'Comedy'];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // --- Top Nav Buttons ---
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildNavButton('Comic'),
                        _buildNavButton('Manga'),
                        _buildNavButton('Novel'),
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.primaryVibrant,
                          child: Text(
                            'P',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        IconButton(
                          icon: const Icon(Icons.notifications_none),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // --- Slider Section ---
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: screenHeight * 0.45,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeTransition(
                  opacity: _fadeAnimation!,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: sliderComics.length,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final comic = sliderComics[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ComicDetailScreen(comic: comic),
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  comic.coverUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            sliderComics.length,
                            (index) => Container(
                              width: 8.0,
                              height: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- Comic Sections ---
            SliverComicSection(
              title: 'Best of The Season',
              comics: mainListComics,
              itemHeight: 250,
            ),
            ...genres.map((genre) => SliverComicSection(
                title: '$genre Comics',
                comics: pool
                    .where((c) => c.genres.contains(genre))
                    .toList(),
                itemHeight: 250,
            )),

            SliverComicSection(
              title: 'Trending Now',
              comics: mainListComics,
              itemHeight: 250,
            ),
            SliverComicSection(
              title: 'New Releases',
              comics: mainListComics,
              itemHeight: 250,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFeed = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                _selectedFeed == title ? FontWeight.bold : FontWeight.normal,
            color:
                _selectedFeed == title ? AppColors.accentDeep : Colors.grey,
          ),
        ),
      ),
    );
  }
}
