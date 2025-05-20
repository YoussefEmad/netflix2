import 'package:flutter/material.dart';
import 'package:netflix/features/home/presentation/screens/upcoming_screen.dart';

import 'home_list_screen.dart';
import 'liked_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _index = 0;
  final pages = [HomeListScreen(), UpcomingScreen(), LikedScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Latest'),
          BottomNavigationBarItem(icon: Icon(Icons.upcoming), label: 'Coming Soon'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Liked'),
        ],
      ),
    );
  }
}
