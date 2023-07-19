import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Compete extends StatefulWidget {
  const Compete({super.key});

  @override
  State<Compete> createState() => _CompeteState();
}

class _CompeteState extends State<Compete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('No Competition Available Now')),
    );
  }
}
