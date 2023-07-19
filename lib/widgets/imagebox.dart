import 'package:flutter/material.dart';

class MyImageBox extends StatelessWidget {
  MyImageBox({super.key,required this.imageUrl});
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 230,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
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
      ),
    );
  }
}
