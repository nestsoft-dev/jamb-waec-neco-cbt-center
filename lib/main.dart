import 'package:flutter/material.dart';
import 'package:new_practice_pal/screens/books.dart';
import 'package:new_practice_pal/screens/compete.dart';
import 'package:new_practice_pal/screens/epin.dart';
import 'package:new_practice_pal/screens/home.dart';
import 'package:new_practice_pal/screens/splash.dart';
import 'package:new_practice_pal/widgets/my_slider.dart';

void main() {
  runApp(const MyApp());
}

// echo "# jamb-waec-neco-cbt-center" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/nestsoft-dev/jamb-waec-neco-cbt-center.git
// git push -u origin main

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice pal pro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      home: const Epins(),
    );
  }
}
