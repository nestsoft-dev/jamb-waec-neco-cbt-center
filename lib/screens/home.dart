import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import '../widgets/box_home.dart';
import '../widgets/my_grid.dart';
import '../widgets/my_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _greeting = '';

  // greetings() {
  //   final currentTime = DateTime.now();
  //   final formatter = DateFormat('HH');

  //   final hour = int.parse(formatter.format(currentTime));

  //   if (hour >= 0 && hour < 12) {
  //     setState(() {
  //       _greeting = 'Good Morning';
  //     });
  //   } else if (hour >= 12 && hour < 18) {
  //     setState(() {
  //       _greeting = 'Good Afternoon';
  //     });
  //   } else {
  //     setState(() {
  //       _greeting = 'Good Evening';
  //     });
  //   }
  // }

  final List<String> imageList = [
    'assets/first.png',
    'assets/fourth.png',
    'assets/logo_o.png',
    'assets/second.png',
    'assets/third.png',
  ];

  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_', // Prefix used for saving data locally
    minDays: 7, // Minimum number of days before showing the dialog
    minLaunches: 2, // Minimum number of app launches before showing the dialog
    remindDays: 7, // Number of days to wait before reminding the user
    remindLaunches:
        10, // Number of app launches to wait before reminding the user
    googlePlayIdentifier:
        'com.netsoftdev.new_practice_pal', // Replace with your app package name
  );

  @override
  void initState() {
    super.initState();
    _rateMyApp.init().then((_) {
      if (_rateMyApp.shouldOpenDialog) {
        Future.delayed(Duration(seconds: 1), () {
          // Delay launching the dialog to allow the UI to initialize.
          _rateMyApp.showStarRateDialog(
            context,
            title: 'Rate this app', // Dialog title
            message: 'Please leave a rating and feedback!', // Dialog message
            dialogStyle: DialogStyle(
              // Customize the dialog appearance
              titleAlign: TextAlign.center,
              messageAlign: TextAlign.center,
              messagePadding: EdgeInsets.only(bottom: 20),
            ),
            actionsBuilder: (context, stars) {
              // Custom action buttons (optional)
              return [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // You can perform an action when the user dismisses the dialog without rating.
                  },
                  child: Text('CANCEL'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (stars != null) {
                      _rateMyApp.save().then((_) => Navigator.pop(context));
                      if (stars >= 4) {
                        // User provided a rating of 4 or 5 stars, you can perform additional actions here.
                      } else {
                        // User provided a rating less than 4 stars, you can handle this as well.
                      }
                    } else {
                      Navigator.pop(context);
                      // User dismissed the dialog without providing a rating, handle this case if necessary.
                    }
                  },
                  child: Text('OK'),
                ),
              ];
            },
            starRatingOptions:
                StarRatingOptions(), // Customize star rating options (optional)
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ikenna',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyBox(),
              SizedBox(
                height: 10,
              ),
              MySlider(),
              SizedBox(
                height: 15,
              ),
              MyGrid(),
            ]),
          ),
        ),
      ),
    );
  }
}
