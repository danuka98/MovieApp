import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/screens/bottom_nav_screen.dart';
import 'package:movieapp/screens/home_screen.dart';
import 'package:movieapp/styles/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kDark, // navigation bar color
    statusBarColor: Colors.transparent
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: kDark
      ),
      home: const BottomNavScreen(),
    );
  }
}

