// lib/main.dart

import 'package:flutter/material.dart';
import 'package:gertoon/core/app_theme.dart';
import 'package:gertoon/features/0_main_navigation/main_screen.dart';

void main() {
  runApp(const GertoonApp());
}

class GertoonApp extends StatelessWidget {
  const GertoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gertoon', // Updated the app title here
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'screens/home_screen.dart';
// import 'screens/recommendation_screen.dart';
// import 'screens/best_screen.dart';
// import 'screens/my_page_screen.dart';
// import 'screens/more_screen.dart';
// import 'screens/detail_screen.dart';
// import 'screens/author_screen.dart';

// void main() {
//   runApp(GerToonApp());
// }


// class GerToonApp extends StatelessWidget {
//   const GerToonApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Gertoon',
//       theme: ThemeData(
//         primaryColor: Color(0xFFA5CFE3),
//         fontFamily: 'Roboto',
//         scaffoldBackgroundColor: Colors.white,
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary: Color(0xFF74B2D4),
//         ),
//         appBarTheme: AppBarTheme(
//           backgroundColor: Color(0xFFA5CFE3),
//           elevation: 0,
//         ),
//       ),
//       home: MainPage(),
//       routes: {
//          DetailScreen.routeName: (_) => DetailScreen(),
//         AuthorScreen.routeName: (_) => AuthorScreen(),
//       },
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _currentIndex = 0;
//   final _pages = [
//     HomeScreen(),
//     RecommendationScreen(),
//     BestScreen(),
//     MyPageScreen(),
//     MoreScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         selectedItemColor: Theme.of(context).colorScheme.secondary,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         onTap: (i) => setState(() => _currentIndex = i),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.hatWizard),
//             label: 'Explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.bolt),
//             label: 'Best',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.bookmark),
//             label: 'My Page',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(FontAwesomeIcons.ellipsisH),
//             label: 'More',
//           ),
//         ],
//       ),
//     );
//   }
// }
