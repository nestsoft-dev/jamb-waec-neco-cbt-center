import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/box_home.dart';
import '../widgets/my_grid.dart';
import '../widgets/my_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _greeting = '';

  // greetings() {
  //   final currentTime = DateTime.now();
  //   final formatter = DateFormat('HH');

  //   final hour = int.parse(formatter.format(currentTime));

  //   if (hour >= 0 && hour < 12) {
  //     setState(() {
  //       _greeting = 'Good Morning';
  //     });
  //   } else if (hour >= 12 && hour < 18) {
  //     setState(() {
  //       _greeting = 'Good Afternoon';
  //     });
  //   } else {
  //     setState(() {
  //       _greeting = 'Good Evening';
  //     });
  //   }
  // }

  final List<String> imageList = [
    'assets/first.png',
    'assets/fourth.png',
    'assets/logo_o.png',
    'assets/second.png',
    'assets/third.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ikenna',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyBox(),
              SizedBox(
                height: 10,
              ),
             MySlider(),

              SizedBox(
                height: 15,
              ),
              MyGrid(),
            ]),
          ),
        ),
      ),
    );
  }
}
