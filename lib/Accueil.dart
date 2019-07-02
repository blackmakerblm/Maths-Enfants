import 'package:flutter/material.dart';
import 'dart:io';
class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
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
                        },child: Text('Jouer '),
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
