import 'package:flutter/material.dart';
import 'dart:io';
class Rejouer extends StatefulWidget {
  @override
  _RejouerState createState() => _RejouerState();
}

class _RejouerState extends State<Rejouer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(onPressed: (){
                    Navigator.pushNamed(context, '/app');
                  },child: Text('Rejouer '),
                    color: Colors.teal,
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(onPressed: (){
                    Navigator.pushNamed(context, '/aide');
                  },child: Text('Aide '),
                    color: Colors.teal,
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(onPressed: (){
                    exit(0);
                  },child: Text('Quitter '),
                    color: Colors.teal,
                  ),
                ],
              ),
            )
        )
    );
  }
}
