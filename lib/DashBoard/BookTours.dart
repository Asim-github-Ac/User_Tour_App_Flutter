import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/universal_variables.dart';

class BookTours extends StatefulWidget {
  const BookTours({Key? key, required this.url, required this.place, required this.desplace, required this.expense, required this.date, required this.stay, required this.city}) : super(key: key);
  final String url;
  final String place;
  final String desplace;
  final String expense;
  final String date;
  final String stay;
  final String city;
  @override
  State<BookTours> createState() => _BookToursState();
}

class _BookToursState extends State<BookTours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniversalVariables.orangeColor,
        title: Text("Please Book your Order"),),
        body: Container(child: Text('${widget.place}'),));
  }
}
