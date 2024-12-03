import 'package:flutter/material.dart';
import 'package:liki_pro/child/bottomscreens/add_contacts.dart';
import 'package:liki_pro/child/bottomscreens/chat_screen.dart';

//import 'package:liki_pro/child/bottomscreens/contactscreen.dart';
import 'package:liki_pro/child/bottomscreens/profilepage.dart';
import 'package:liki_pro/child/bottomscreens/rating.dart';

import 'package:liki_pro/home_screen.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _currentIndex = 0;

  // List of pages corresponding to each BottomNavigationBar item
  final List<Widget> _pages = [
    HomeScreen(),
    AddContactsPage(),
    Rating(),
    Profilepage(),
    ChatScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index when a tab is selected
          });
        },
        backgroundColor: Colors.white, // Set the background color
        selectedItemColor: Colors.blue, // Color of selected item
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rating',
          ),
        ],
      ),
    );
  }
}