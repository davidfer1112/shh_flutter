import 'package:flutter/material.dart';

import '../utils/themes.dart';

class CommonCard extends StatefulWidget{

  final Color? color;
  final double readius;
  final Widget? child;

  CommonCard ({Key? key, this.color, required this.readius, this.child}) : super(key: key);

  @override
  _CommonCardState createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard>{

  @override
  Widget build (BuildContext context){
    return Card(
      elevation: AppTheme.isLightMode ? 4 : 0,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.readius),
      ),
      child: widget.child,
    );
  }

}