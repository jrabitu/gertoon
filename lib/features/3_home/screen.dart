// lib/features/3_home/screen.dart

import 'package:flutter/material.dart';
import 'package:gertoon/core/app_colors.dart';
import 'package:gertoon/data/mock_data.dart';
import 'package:gertoon/data/models/comic_model.dart';
import 'package:gertoon/shared_widgets/comic_card.dart';
import 'package:gertoon/features/4_comic_detail/comic_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController(viewportFraction: 0.85);
//   String _selectedFeed = 'Webtoon'; // Default selected feed

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final CustomScrollView _scrollController = CustomScrollView();
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  String _selectedFeed = 'Webtoon'; // Default selected feed

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController?.dispose();
    super.dispose();
  }

// The main build method for the HomeScreen
  // It includes a top navigation bar, a comic slider, and a list of comics.
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Comic> sliderComics = mockComics.take(5).toList();

    // Determine content for our main list based on selected feed
    final List<Comic> mainListComics = mockComics.where((comic) {
      if (_selectedFeed == 'Webtoon') return comic.genres.contains('Romance'); // Example logic
      if (_selectedFeed == 'Manga') return comic.genres.contains('Action'); // Example logic
      if (_selectedFeed == 'Book') return comic.genres.contains('Fantasy'); // Example logic
      return true;
    }).toList();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         children: [
      //           _buildNavButton('Webtoon'),
      //           _buildNavButton('Manga'),
      //           _buildNavButton('Book'),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           const CircleAvatar(
      //             radius: 12,
      //             backgroundColor: AppColors.primaryVibrant,
      //             child: Text(
      //               'P',
      //               style: TextStyle(
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //           const SizedBox(width: 8.0),
      //           IconButton(
      //             icon: const Icon(Icons.notifications_none),
      //             onPressed: () {},
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        // controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: screenHeight * 0.5,
            floating: false,
            pinned: false, //not pinning to the top
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
                                builder: (context) => ComicDetailScreen(comic: comic),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                comic.coverUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          sliderComics.length,
                          (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _currentPage == index ? Colors.white : Colors.white.withOpacity(0.5),
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
       
          SliverToBoxAdapter(
            child:  Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Text(
                'Best of The Season',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
                 SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: mainListComics.length,
                        itemBuilder: (context, index) {
                          final comic = mainListComics[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComicDetailScreen(comic: comic),
                                ),
                              );
                            },
                            child: ComicCard(comic: comic),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: mainListComics.length,
                        itemBuilder: (context, index) {
                          final comic = mainListComics[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComicDetailScreen(comic: comic),
                                ),
                              );
                            },
                            child: ComicCard(comic: comic),
                          );
                        },
                      ),
                    ),
          ),
          SliverToBoxAdapter(
            child:  SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: mainListComics.length,
                        itemBuilder: (context, index) {
                          final comic = mainListComics[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComicDetailScreen(comic: comic),
                                ),
                              );
                            },
                            child: ComicCard(comic: comic),
                          );
                        },
                      ),
                    ),
          ),
        ]
      ),
    );


    // return Scaffold(
    //   body: SafeArea( // Keep SafeArea here for the whole body
    //     child: Column(
    //       children: [
    //         // The fixed top navigation bar ------- zasahhh
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           _buildNavButton('Webtoon'),
            //           _buildNavButton('Manga'),
            //           _buildNavButton('Book'),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           // Placeholder for the "P" icon in the screenshot
            //           const CircleAvatar(
            //             radius: 12,
            //             backgroundColor: AppColors.primaryVibrant,
            //             child: Text(
            //               'P',
            //               style: TextStyle(
            //                 fontSize: 10,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //           const SizedBox(width: 8.0),
            //           IconButton(
            //             icon: const Icon(Icons.notifications_none),
            //             onPressed: () {
            //               // TODO: Implement notification functionality
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
    //         // NEW: The divider line
    //         const Divider(height: 1, thickness: 1, color: Colors.grey),
    //         // The rest of the content will now be in an Expanded CustomScrollView
    //         Expanded(
    //           child: CustomScrollView(
    //             slivers: <Widget>[
    //               SliverAppBar(
    //                 backgroundColor: Colors.transparent,
    //                 expandedHeight: screenHeight * 0.5,
    //                 floating: false,
    //                 pinned: false, //not pinning to the top
    //                 flexibleSpace: FlexibleSpaceBar(
    //                   background: Stack(
    //                     fit: StackFit.expand,
    //                     children: [
    //                       PageView.builder(
    //                         controller: _pageController,
    //                         itemCount: sliderComics.length,
    //                         onPageChanged: (int index) {
    //                           setState(() {
    //                             _currentPage = index;
    //                           });
    //                         },
    //                         itemBuilder: (context, index) {
    //                           final comic = sliderComics[index];
    //                           return GestureDetector(
    //                             onTap: () {
    //                               Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                   builder: (context) => ComicDetailScreen(comic: comic),
    //                                 ),
    //                               );
    //                             },
    //                             child: Container(
    //                               margin: const EdgeInsets.symmetric(horizontal: 2.0),
    //                               child: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(16.0),
    //                                 child: Image.network(
    //                                   comic.coverUrl,
    //                                   fit: BoxFit.fill,
                                    
    //                                 ),
    //                               ),
    //                             ),
    //                           );
    //                         },
    //                       ),
    //                       Positioned(
    //                         bottom: 20,
    //                         left: 0,
    //                         right: 0,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: List.generate(
    //                             sliderComics.length,
    //                             (index) => Container(
    //                               width: 8.0,
    //                               height: 8.0,
    //                               margin: const EdgeInsets.symmetric(horizontal: 4.0),
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: _currentPage == index
    //                                     ? Colors.white
    //                                     : Colors.white.withOpacity(0.5),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SliverToBoxAdapter(
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    //                   child: Text(
    //                     'Best of The Season',
    //                     style: Theme.of(context).textTheme.headlineSmall,
    //                   ),
    //                 ),
    //               ),
    //               SliverToBoxAdapter(
    //                 child: SizedBox(
    //                   height: 250,
    //                   child: ListView.builder(
    //                     scrollDirection: Axis.horizontal,
    //                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //                     itemCount: mainListComics.length,
    //                     itemBuilder: (context, index) {
    //                       final comic = mainListComics[index];
    //                       return GestureDetector(
    //                         onTap: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder: (context) => ComicDetailScreen(comic: comic),
    //                             ),
    //                           );
    //                         },
    //                         child: ComicCard(comic: comic),
    //                       );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
            fontWeight: _selectedFeed == title ? FontWeight.bold : FontWeight.normal,
            color: _selectedFeed == title ? AppColors.accentDeep : Colors.grey,
          ),
        ),
      ),
    );
  }
}