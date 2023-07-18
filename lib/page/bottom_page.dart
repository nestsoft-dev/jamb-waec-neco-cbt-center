import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/books.dart';
import '../screens/compete.dart';
import '../screens/epin.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

//home,book,competitions,epin,profile,

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [HomePage(), Books(), Compete(), Epins(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      //backgroundColor: Colors.blueAccent,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.book), label: 'Books'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.question), label: 'Compete'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.receipt), label: 'E-pin'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
          ]),
    );
  }
}
