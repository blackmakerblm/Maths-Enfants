import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'calcul.dart';
import 'Compte.dart';
import 'Accueil.dart';
import 'rejouer.dart';
import 'aide.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) =>Accueil(),
    '/app': (context) =>MyApp(),
    '/aide': (context) =>Aide(),
    '/rejouer': (context) =>Rejouer(),
  },
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageindex = 0;

  final Compte _listproduct=Compte();

  final Calcul _client=Calcul();

  Widget _showpage;

  @override
  void initState(){
    super.initState();
        _showpage=pagechooser(0);
  }

  Widget pagechooser(int index){
    switch(index){
      case 0:
        return _listproduct;break;
      case 1:
        return _client;break;
      default:
        return Container(
          child: Center(child: Text("No page Found for this index"),),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor:Colors.amberAccent,
          title: Center(child: Text('MATHS ENFANT',style: TextStyle(color: Colors.black),)),
        ),
        body: Center(
          child:_showpage,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          initialIndex: pageindex,
          items: <Widget>[
            Icon(Icons.insert_emoticon, size: 30),
            Icon(Icons.exposure, size: 30),
          ],
          color: Colors.amberAccent,
          buttonBackgroundColor: Colors.white,
          backgroundColor:Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedindex) {
            setState(() {
              _showpage = pagechooser(tappedindex);
            });
          },
        ),
      ),
    );
  }
}