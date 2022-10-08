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

  TextEditingController textNameController=TextEditingController();
  TextEditingController textPasswordController=TextEditingController();
  TextEditingController textPhoneController=TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: UniversalVariables.whiteColor,
        padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
        child: Form(
          key: _formKey,
          child: buildForm(),
        ),
      ),
    );
  }

  buildForm(){
    return Column(
      children:[
        SizedBox(height:20.0),
        FlutterLogo(size: 200.0,),
        SizedBox(height:20.0),
        TextFormField(

          controller: textNameController,
          decoration: InputDecoration(
              hintText: "Email"
          ),
        ),
        TextFormField(
          maxLength: 10,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          controller: textPhoneController,
          decoration: InputDecoration(
              hintText: "PhoneNo"
          ),
        ),
        TextFormField(

          controller: textPasswordController,
          decoration: InputDecoration(
              hintText: "Password"
          ),
        ),
        SizedBox(height:20.0),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(UniversalVariables.orangeColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),)
            ),
          ),
          onPressed: () {},
          child: Text("Register",style:TextStyle(color:UniversalVariables.whiteColor,)),
        ),
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