import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/constants.dart';
import '../screens/signup.dart';
import '../widgets/mybutton.dart';

class IntoPage extends StatefulWidget {
  const IntoPage({super.key});

  @override
  State<IntoPage> createState() => _IntoPageState();
}

class _IntoPageState extends State<IntoPage> {
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  int _currentPage = 0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
              _currentPage = index;
            });
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Image.asset(introList[index]['image']!),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          introList[index]['title'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            introList[index]['des'],
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          ),
                        ), //indicator
                      ],
                    ),
                  ),
                  _currentPage + 1 == introList.length
                      ? Positioned(
                          bottom: 30,
                          right: 50,
                          left: 50,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text('Get Started',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: 30,
                          right: 50,
                          left: 50,
                          child: Center(
                            child: SmoothPageIndicator(
                                controller: pageController, // PageController
                                count: introList.length,
                                effect: WormEffect(), // your preferred effect
                                onDotClicked: (index) {}),
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }
}
