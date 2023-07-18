import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 700,
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
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    );
                  }),
            );
  }
}