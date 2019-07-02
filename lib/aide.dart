import 'package:flutter/material.dart';
class Aide extends StatefulWidget {
  @override
  _AideState createState() => _AideState();
}

class _AideState extends State<Aide> {
  static const String data="Pour jouer à ce jeu vous devez dabord avoir Difference between final and const is that const variables are compile time constants i.e. const variables must have a value during compile time, for example  const PI = 3.14; , whereas variables that are final can only be assigned once, they need not be assigned during compile time and can be assigned during runtime."
      ;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.teal,
          child: Center(child: Text(data,style: TextStyle(fontSize: 10,color: Colors.white),)),
        )
      ],
    );
  }
}
