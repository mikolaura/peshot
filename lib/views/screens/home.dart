import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travenor/views/screens/explore_screen.dart';
import 'package:travenor/views/screens/profile_screen.dart';

import 'add_screen.dart';
import 'home_screen.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  void change(){
    LevelUp(){
    setState(() {
        _index = 3;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var pages = [
    HomeScreen(change: change),
    AddScreen(),
    ProfileScreen(),
    // ExploreScreen(controller: TextEditingController(),)
  ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(onTap: (int index){
        setState(() {
          _index = index;
        });
      },
      selectedItemColor: Theme.of(context).primaryColor
      ,currentIndex: _index,items: 
      [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add your hotel'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

      ]),
      body: pages[_index],
    );
  }
}