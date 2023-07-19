import 'package:flutter/material.dart';

import '../screens/books.dart';
import '../screens/games.dart';
import '../screens/select_subject.dart';

class MyGrid extends StatelessWidget {
  MyGrid({super.key});
  List<String> names = [
    'JAMB',
    'WAEC',
    'NECO',
    'QUIZ',
    'BOOKS',
    'GAMES',
  ];

  screens(int index) {
    if (index == 0) {
      return SelectSingleSubject(
        type: 'JAMB',
      );
    } else if (index == 1) {
      return SelectSingleSubject(
        type: 'WAEC',
      );
    } else if (index == 2) {
      return SelectSingleSubject(
        type: 'NECO',
      );
    } else if (index == 3) {
      return SelectSingleSubject(
        type: 'QUIZ',
      );
    } else if (index == 4) {
      return Books();
    } else if (index == 5) {
      return Games();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      padding: EdgeInsets.all(10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisCount: 3,
            // childAspectRatio: 1.7,
            // mainAxisSpacing: 5,
            // crossAxisSpacing: 5,
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => screens(index)));
              },
              child: Container(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/cbt.png',
                        height: 80,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(names[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
