import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/Authentication/LoginPage.dart';

class SplashScreen extends StatefulWidget {



    @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => LoginPageContent()
                )
            )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100.0,
            child: Image.network("https://img.freepik.com/free-vector/detailed-travel-logo_23-2148616611.jpg?w=2000"),
          ),
        ),
      ),
    );
  }
}
