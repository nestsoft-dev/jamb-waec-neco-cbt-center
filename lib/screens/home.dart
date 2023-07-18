import 'package:flutter/material.dart';

import '../widgets/box_home.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
            Container(
              height: 550,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[100],
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 224, 224, 224),
                              offset: Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Column(
                        children: [
                          Image.asset('assets/cbt.png'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('3.74',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
