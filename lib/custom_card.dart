import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget{

  CustomCard({Key key,@required this.icon,@required this.text});
  Icon icon;
  String text;

  Widget build(BuildContext context){
    return Card(
      color: Colors.indigoAccent,
      child: Column(
        children: [icon, Text(text)],
      ),
    );
  }
}