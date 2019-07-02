import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:animator/animator.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
class Compte extends StatefulWidget {
  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequence;
  static int container1;
  static int container2;
  static int container3;
  static int container4;
  static int preval1;
  static int preval2;
  static int preval3;
  static int preval4;
  static int compteur;
  static Random aleatoire1=new Random();
  static Color _color1;
  static Color _color2;
  static Color _color3;
  static Color _color4;
  static int aleatoire;
  void affectation(){
    aleatoire=aleatoire1.nextInt(3);
    if(aleatoire==0){
      container1=preval1;
      container2=preval2;
      container3=preval3;
      container4=preval4;
    }else if(aleatoire==1){
      container1=preval3;
      container2=preval1;
      container3=preval4;
      container4=preval2;
    }else if(aleatoire==2){
      container1=preval2;
      container2=preval4;
      container3=preval3;
      container4=preval1;
    }else if(aleatoire==3){
      container1=preval4;
      container2=preval2;
      container3=preval3;
      container4=preval1;
    }
  }
void initState(){
  super.initState();
  compteur=1;
  preval1=1;
  preval2=2;
  preval3=3;
  preval4=4;
  affectation();
  _color1=Colors.white;
  _color2=Colors.white;
  _color3=Colors.white;
  _color4=Colors.white;
  controller=AnimationController(vsync: this);
  sequence=SequenceAnimationBuilder().addAnimatable(animatable: Tween<double>(begin: 15,end: 16),
      from: Duration(milliseconds: 0),
      to: Duration(milliseconds: 500),
      tag: 'taille').addAnimatable(animatable: ColorTween(begin: Colors.blue,end: Colors.green),
      from: Duration(milliseconds: 0),
      to: Duration(milliseconds: 500),
      tag: 'color2')
      .animate(controller);
  controller.forward();
  controller.addStatusListener((status) {
    if (status == AnimationStatus.completed) {

      controller.reverse();

    }
    else if(status == AnimationStatus.dismissed)
      controller.forward();
  });
}
  void _onAlertButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(Icons.error_outline,color: Colors.red,size: 50,),
            content: Text('reessayez'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),

            ],
          );
        });
  }

  void _onAlertButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(Icons.verified_user,color: Colors.green,size: 50,),
            content: Text('Bravo continuez comme ça'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('COOL')),
            ],
          );
        });
  }
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;
  @override
  Widget build(BuildContext context) {
    return Animator(
        tween: Tween<double>(begin: 0, end: 300),
    cycles: 0,
    builder: (anim) => Center(
    child: AnimatedBuilder(animation: controller,
    builder: (BuildContext context,Widget child){
    return   Column(
      children: <Widget>[
        Container(
          height: 10,
        ),
        Container(
          height: 60,
          width: 350,
          color: Colors.white,
          child: Center(
            child: Text('Appuyez sur les chiffres en ordre croissant',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: sequence['taille'].value
                  ,color: sequence['color2'].value),
            ),
          ),

        ),
        Container(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  if(container1==compteur||container1==compteur-1)
                  {
                    setState(() {
                      if(compteur!=0)
                        if(compteur%4==0){
                          _color1=Colors.white;
                          _color2=Colors.white;
                          _color3=Colors.white;
                          _color4=Colors.white;

                          preval1=preval4+1;
                          preval2=preval1+1;
                          preval3=preval2+1;
                          preval4=preval3+1;
                          affectation();
                          _onAlertButton(context);
                        }else
                          _color1=Colors.green;
                      compteur+=1;
                    });
                  }
                  else{
                    setState(() {
                      _color1=Colors.red;

                    });
                    _onAlertButtonPressed(context);
                  }

                },
                child: Card(
                  color: _color1,
                  child: Center(child: Text('$container1',style: TextStyle(fontSize: 35),)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(container2==compteur||container2==compteur-1)
                  {
                    setState(() {
                      if(compteur!=0)
                        if(compteur%4==0){
                          _color1=Colors.white;
                          _color2=Colors.white;
                          _color3=Colors.white;
                          _color4=Colors.white;

                          preval1=preval4+1;
                          preval2=preval1+1;
                          preval3=preval2+1;
                          preval4=preval3+1;
                          affectation();
                          _onAlertButton(context);
                        }
                        else
                          _color2=Colors.green;
                      compteur+=1;
                    });
                  }
                  else{
                    setState(() {
                      _color1=Colors.red;

                    });
                    _onAlertButtonPressed(context);
                  }
                },
                child: Card(
                  color: _color2,
                  child: Center(child: Text('$container2',style: TextStyle(fontSize: 35),)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(container3==compteur||container3==compteur-1)
                  {
                    setState(() {
                      if(compteur!=0)
                        if(compteur%4==0){
                          _color1=Colors.white;
                          _color2=Colors.white;
                          _color3=Colors.white;
                          _color4=Colors.white;

                          preval1=preval4+1;
                          preval2=preval1+1;
                          preval3=preval2+1;
                          preval4=preval3+1;
                          affectation();
                          _onAlertButton(context);
                        }else
                          _color3=Colors.green;
                      compteur+=1;
                    });
                  }
                  else
                  {
                    setState(() {
                      _color1=Colors.red;

                    });
                    _onAlertButtonPressed(context);
                  }
                },
                child: Card(
                  color: _color3,
                  child: Center(child: Text('$container3',style: TextStyle(fontSize: 35),)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(container4==compteur||container4==compteur-1)
                  {
                    setState(() {
                      if(compteur!=0)
                        if(compteur%4==0){
                          _color1=Colors.white;
                          _color2=Colors.white;
                          _color3=Colors.white;
                          _color4=Colors.white;

                          preval1=preval4+1;
                          preval2=preval1+1;
                          preval3=preval2+1;
                          preval4=preval3+1;
                          affectation();
                          _onAlertButton(context);
                        }else
                          _color4=Colors.green;
                      compteur+=1;
                    });
                  }
                  else
                  {
                    setState(() {
                      _color1=Colors.red;

                    });
                    _onAlertButtonPressed(context);
                  }
                },
                child: Card(
                  color: _color4,
                  child: Center(child: Text('$container4',style: TextStyle(fontSize: 35),)),
                ),
              ),

            ],
          ),
        ),
      ],
    );
    }
    )
  )
  );
 }
}