import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../widgets/calculator.dart';
import '../widgets/imagebox.dart';

class SingleQuestion extends StatefulWidget {
  const SingleQuestion({super.key});

  @override
  State<SingleQuestion> createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
TextToSpeech tts = TextToSpeech(); 
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Text('English'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '2024 JAMB',
              style: TextStyle(
                // color: Colors.black,
                fontSize: 18,
                //fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Calculator()));
        },
        child: Icon(FontAwesomeIcons.calculator),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Section',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: () {
                      tts.speak('Good morning user');  
                    }, icon: Icon(Icons.volume_down))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.all(10),
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
                  child: Center(
                      child: Text(
                    'Who developed flutter',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MyImageBox(
                imageUrl: 'assets/third.png',
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question 1',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '1/40',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
