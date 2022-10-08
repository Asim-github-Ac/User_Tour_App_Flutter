/*
 * Copyright (c) 2021 Akshay Jadhav <jadhavakshay0701@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_tourist/DashBoard/homepage.dart';

import '../utils/universal_variables.dart';
import 'LoginPage.dart';



class RegisterPageContent extends StatefulWidget {
  @override
  _RegisterPageContentState createState() => _RegisterPageContentState();
}

class _RegisterPageContentState extends State<RegisterPageContent> {

  TextEditingController textEmail=TextEditingController();
  TextEditingController textPasswordController=TextEditingController();
  TextEditingController textPhoneController=TextEditingController();
  TextEditingController textname=TextEditingController();
  TextEditingController textcity=TextEditingController();
  
 Future<void> SignUp() async {
   try {
     final userCredential =
         await FirebaseAuth.instance.createUserWithEmailAndPassword(email:textEmail.text,password:textPasswordController.text);
     gotoHomePage();
   } on FirebaseAuthException catch (e) {
     switch (e.code) {
       case "invalid-custom-token":
         print("The supplied token is not a Firebase custom auth token.");
         break;
       case "custom-token-mismatch":
         print("The supplied token is for a different Firebase project.");
         break;
       default:
         print("Unkown error.");
     }
   }
 }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: UniversalVariables.whiteColor,
          padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
          child: Form(
            child: buildForm(),
          ),
        ),
      ),
    );
  }

  buildForm(){
    return Column(
      children:[
        SizedBox(height:20.0),
        Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100.0,
            child: Image.network("https://img.freepik.com/free-vector/detailed-travel-logo_23-2148616611.jpg?w=2000"),
          ),
        ),
        SizedBox(height:20.0),
        TextFormField(
          controller: textname,
          decoration: InputDecoration(
            hintText: 'Name',
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: textEmail,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          maxLength: 10,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          controller: textPhoneController,
          decoration: InputDecoration(
            hintText: 'Phone',
            prefixIcon: Icon(Icons.phone),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: textcity,
          decoration: InputDecoration(
            hintText: 'City',
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: textPasswordController,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(UniversalVariables.orangeColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),)
              ),),
            onPressed: (){

              SignUp();
            },
            child: Text("Register",style:TextStyle(color: UniversalVariables.whiteColor,fontSize: 24)),
          ) ,
        ),
        TextButton.icon(onPressed:(){gotoLoginPage();}, icon: Icon(Icons.person_add), label: Text("Already Login ? Click Here..",style:TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),)
      ],
    );
  }

  gotoLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPageContent()));
  }

  gotoHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageContent()));
  }
}