import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/Authentication/LoginPage.dart';
import 'package:user_tourist/Authentication/SplashScreen.dart';
import 'package:user_tourist/DashBoard/DashHome.dart';
import 'package:user_tourist/DashBoard/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourist App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}
