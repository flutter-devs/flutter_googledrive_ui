import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_drive_proj/Constants/constants.dart';
import 'package:google_drive_proj/screen/google_drive.dart';
import 'package:google_drive_proj/screen/second_page.dart';
import 'package:google_drive_proj/screen/splashscreen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.blue[800],
      // statusBarColor:Colors.white54, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'AEO UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      routes: <String, WidgetBuilder> {
        Constants.SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        Constants.GOOGLE_DRIVE: (BuildContext context) => GoogleDrive(),
        Constants.SECOND_PAGE: (BuildContext context) => SecondPage(),
      },
      initialRoute: Constants.SPLASH_SCREEN,
    );
  }
}

