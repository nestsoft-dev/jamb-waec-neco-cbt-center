import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  MyButton(
      {super.key,
      required this.isLoading,
      required this.tap,
      required this.text});
  bool isLoading;
  String text;
  Function tap;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.tap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text('Get Started'),),
        ),
      ),
    );
  }
}
