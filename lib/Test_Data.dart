import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {


  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text('Anime app')),

      body: StreamBuilder(
          stream: ( searchtxt!= "" && searchtxt!= null)?FirebaseFirestore.instance.collection("Tours").where("specilization",isNotEqualTo:searchtxt).orderBy("specilization").startAt([searchtxt,])
              .endAt([searchtxt+'\uf8ff',])
              .snapshots()
              :FirebaseFirestore.instance.collection("addjop").snapshots(),
          builder:(BuildContext context,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.hasData != true) {
              return Center(
                child:CircularProgressIndicator(),
              );
            }
            else
            {

            }
          } ,
          ),
    );
  }
}
