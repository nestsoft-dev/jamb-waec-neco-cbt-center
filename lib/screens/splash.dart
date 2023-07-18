import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../page/intro_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntoPage()));
    });
    return Scaffold(
      body: Center(
          child: Lottie.asset('assets/loading.json',
              repeat: true, height: 120, width: 230)),
    );
  }
}
