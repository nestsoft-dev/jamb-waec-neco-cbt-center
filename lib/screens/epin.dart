import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../widgets/box_home.dart';
import '../widgets/textfield.dart';

class Epins extends StatefulWidget {
  const Epins({super.key});

  @override
  State<Epins> createState() => _EpinsState();
}

class _EpinsState extends State<Epins> {
  final List<String> items = [
    'WAEC',
    'NECO',
    'NABTEB',
  ];
  String? selectedValue;
  double price = 00.0;
  calculatePrice(String value) {
    if (value == 'WAEC') {
      price = 3150;
    } else if (value == 'NECO') {
      price = 1200;
    } else {
      price = 1300;
    }
    setState(() {});
  }

  TextEditingController fullname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  void dispose() {
    fullname.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Student Exam SCRATCH CARD',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              MyBox(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select Exam Type',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
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
                    calculatePrice("$value");
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
              SizedBox(
                height: 10,
              ),
              selectedValue == null
                  ? SizedBox.shrink()
                  : Text(
                      'The Selected price for ${selectedValue} is \₦$price',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              MyTextInput(
                hint: 'Enter Full Name',
                ispassword: false,
                maxlength: 30,
                textEditingController: fullname,
                textInputType: TextInputType.name,
              ),
              MyTextInput(
                hint: 'Enter Phone Number',
                ispassword: false,
                maxlength: 11,
                textEditingController: phoneNumber,
                textInputType: TextInputType.number,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text('Purchase Pin',
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
      ),
    );
  }
}
