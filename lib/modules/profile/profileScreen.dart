import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  final AnimationController animationController;

  const ProfileScreen({Key? key, required this.animationController}) : super(key: key);

  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}


class _BottomTabScreenState extends State<ProfileScreen>{

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("Porfile Screen"),
      ),
    );
  }

}