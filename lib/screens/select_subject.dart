import 'package:cool_alert/cool_alert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:new_practice_pal/screens/single_question.dart';

import 'jamb_exam.dart';

class SelectSingleSubject extends StatefulWidget {
  SelectSingleSubject({super.key, required this.type});
  String type;

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
      } else if (widget.type == 'JAMB'
          ? _selectedSubjects.length < 4
          : _selectedSubjects.length < 1) {
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
    final List<String> items = [
    '2001',
    '2002',
    '2003',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
  ];

    String? selectedValue;

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
            
            
            SizedBox(height: 10,),
               Text(
                'Select Year',
                style: TextStyle(fontSize: 18),
              ),
                SizedBox(
                height: 10,
              ),
               DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.grey[100],
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select Exam Type',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                  //  calculatePrice("$value");
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 230,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.grey[100],
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.grey[200],
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey[100],
                    ),
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            

            //selectedValue
           SizedBox(height: 10,),
            GestureDetector(
                onTap: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => SignUp()));
                  if(selectedValue == ''|| _selectedTime == []||_selectedSubjects == []){
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: "Please Select the Options",
                        title: "Error");
                  }else if(widget.type=='JAMB'){

                    //TODO:pass parameter for jamb
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => JambExamScreen()));
                  }else{
                       Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SingleQuestion()));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
