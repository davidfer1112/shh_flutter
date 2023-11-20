import 'package:flutter/material.dart';

class MyTripsScreen extends StatefulWidget {

  final AnimationController animationController;

  const MyTripsScreen({Key? key, required this.animationController}) : super(key: key);

  @override
  _MyTripsScreenState createState() => _MyTripsScreenState();

}

class _MyTripsScreenState extends State<MyTripsScreen>{

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("My Trips Screen"),
      ),
    );
  }

}