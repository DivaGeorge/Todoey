import 'package:flutter/material.dart';
import 'package:my_project/home.dart';
import 'package:my_project/profile.dart';
import 'package:my_project/screen_search.dart';



class Main_Home extends StatefulWidget {
  const Main_Home({super.key});

  @override
  State<Main_Home> createState() => _Main_HomeState();
}

class _Main_HomeState extends State<Main_Home> {

int _currentSelectedIndex = 0;

  final _pages =[
    HomeScreen(),
    Screen_profile(),
    Screen_search(),
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
          currentIndex: _currentSelectedIndex,
          onTap: (newIndex) {
            setState(() {
              _currentSelectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ]),
      
      
    );
  }
}