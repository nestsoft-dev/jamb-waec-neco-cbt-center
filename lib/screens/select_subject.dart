import 'package:flutter/material.dart';

class SelectSingleSubject extends StatefulWidget {
  const SelectSingleSubject({super.key});

  @override
  State<SelectSingleSubject> createState() => _SelectSingleSubjectState();
}

class _SelectSingleSubjectState extends State<SelectSingleSubject> {
  int? selectedTime;
  List<int> timeoptions = [
    15,
    20,
    25,
    30,
    35,
    40,
  ];

  final List<String> _allSubjects = [
    'History',
    'English',
    'Mathematics',
    'Commerce',
    'Accounting',
    'Biology',
    'Physics',
    'Chemistry',
    'Englishlit',
    'Government',
    'CRK',
    'Geography',
    'Economics',
    'IRK',
    'Civiledu',
    'Currentaffairs',
    'Insurance',
  ];

  List<String> _selectedSubjects = [];
  List<int> _selectedTime = [];

  void _onChipSelected(String subject) {
    setState(() {
      if (_selectedSubjects.contains(subject)) {
        _selectedSubjects.remove(subject);
      } else if (_selectedSubjects.length < 1) {
        _selectedSubjects.add(subject);
      }
    });
  }

  void _onChipSelectedTime(int subject) {
    setState(() {
      if (_selectedTime.contains(subject)) {
        _selectedTime.remove(subject);
      } else if (_selectedTime.length < 1) {
        _selectedTime.add(subject);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Select Subject:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: _allSubjects.map((subject) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                        child: ChoiceChip(
                          label: Text(subject),
                          selected: _selectedSubjects.contains(subject),
                          onSelected: (bool selected) {
                            _onChipSelected(subject);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please Select Time For Question',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: timeoptions.map((subject) {
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
                      child: ChoiceChip(
                        label: Text("$subject"),
                        selected: _selectedTime.contains(subject),
                        onSelected: (bool selected) {
                          _onChipSelectedTime(subject);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
