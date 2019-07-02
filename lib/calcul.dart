import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
class Calcul extends StatefulWidget {
  @override
  _CalculState createState() => _CalculState();
}

class _CalculState extends State<Calcul> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  SequenceAnimation sequence;
  SequenceAnimation sequence2;
  static AudioCache player=AudioCache(prefix: 'audio/');
  static Random aleatoire1=new Random();
  static int premier=aleatoire1.nextInt(10);
  static int second=aleatoire1.nextInt(10);
  static int resultat=premier+second;
  static int faux=aleatoire1.nextInt(20);
  static int container1;
  static int container2;
  static int compteur;
  static int point;
  Icon icon;
  void actualiser(){
    faux=aleatoire1.nextInt(10);
    if(faux==premier+second)
      actualiser();
  }
  void affectation(){
    resultat=premier+second;
    actualiser();
    compteur=aleatoire1.nextInt(20);
    if(compteur%2==0)
      {
        container1=resultat;
        container2=faux;
      }
    else
      {
        container2=resultat;
        container1=faux;
      }
  }
  bool b=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    point=6;
    affectation();
    player.loadAll(['vrai1.mp3','faux.mp3']);
    controller=AnimationController(vsync: this);
    controller2=AnimationController(vsync: this);
    sequence2=SequenceAnimationBuilder().addAnimatable(animatable: Tween<double>(begin:1,end: 0),
        from: Duration(seconds: 0),
        to: Duration(seconds: 4),
        tag: 'countdown').animate(controller2);
    sequence=SequenceAnimationBuilder().addAnimatable(animatable: ColorTween(begin: Colors.purple,end: Colors.orange),
        from: Duration(seconds: 0),
        to: Duration(seconds: 2),
        tag: 'color').addAnimatable(animatable: ColorTween(begin: Colors.orange,end: Colors.lightGreenAccent),
        from: Duration(seconds: 2),
        to: Duration(seconds: 4),
        tag: 'color').addAnimatable(animatable: ColorTween(begin: Colors.white,end: Colors.blue),
        from: Duration(seconds: 0),
        to: Duration(seconds: 2),
        tag: 'color2').addAnimatable(animatable: ColorTween(begin: Colors.blue,end: Colors.amberAccent),
        from: Duration(seconds: 2),
        to: Duration(seconds: 4),
        tag: 'color2').addAnimatable(animatable: Tween<Offset>(begin: Offset(-96, 0),end: Offset(96, 0)),
        from: Duration(seconds: 0),
        to: Duration(seconds: 4),
        tag: 'trans').animate(controller);
    controller.forward();
    controller2.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {

        controller.reverse();

      }
      else if(status == AnimationStatus.dismissed)
        controller.forward();
    });

    controller2.addListener((){
      if(sequence2['countdown'].value==0){
        setState(() {
          if(point>3)
            point-=3;
          premier=aleatoire1.nextInt(10);
          second=aleatoire1.nextInt(10);
          actualiser();
          affectation();

        });
        controller2.reset();
        controller2.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Animator(
      tween: Tween<double>(begin: 0, end: 300),
      cycles: 0,
      builder: (anim) => Center(
        child: AnimatedBuilder(animation: controller,
            builder: (BuildContext context,Widget child){
          return Column(
            children: <Widget>[
              Flexible(
                  child:
                  ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      color: Colors.lightBlueAccent,
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 352,
                                alignment: Alignment.topRight,
                                child: Text('$point POINT(S)',style: TextStyle(fontSize: 20,color: Colors.white),),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          Center(child: Text('$premier  +  $second',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: LinearProgressIndicator(
                      value: sequence2['countdown'].value,
                      backgroundColor: Colors.red,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 50,
                  ),
                    Center(
                      child: Transform.translate(
                        offset: sequence['trans'].value,
                        child: GestureDetector(
                          onTap: (){
                            if(container1==(premier+second)){
                              player.play('vrai1.mp3');
                              controller2.reset();
                              controller2.forward();
                              setState(() {
                                point+=3;
                                premier=aleatoire1.nextInt(10);
                                second=aleatoire1.nextInt(10);
                                actualiser();
                                affectation();
                              });
                            }else{
                              player.play('faux.mp3');
                              controller2.reset();
                              controller2.forward();

                              setState(() {
                                if(point==3)
                                  Navigator.pushNamed(context, '/rejouer');
                                else
                                if(point>3)
                                  point-=3;
                                premier=aleatoire1.nextInt(10);
                                second=aleatoire1.nextInt(10);
                                actualiser();
                                affectation();
                              });
                            }
                          },
                          child: Container(
                            height: 75,
                            width: 105,
                            //color: sequence['color'].value,
                            decoration: BoxDecoration(
                              color:sequence['color'].value ,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Text('$container1',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    Center(
                      child: Transform.translate(
                        offset: -sequence['trans'].value,
                        child: GestureDetector(
                          onTap: (){
                            if(container2==(premier+second)){
                              player.play('vrai1.mp3');
                              controller2.reset();
                              controller2.forward();
                              setState(() {
                                  point+=3;
                                premier=aleatoire1.nextInt(10);
                                second=aleatoire1.nextInt(10);
                                actualiser();
                                affectation();
                              });
                            }else{
                              player.play('faux.mp3');
                              controller2.reset();
                              controller2.forward();

                              setState(() {
                                //ca marche pas a regler
                                if(point==3)
                                  Navigator.pushNamed(context, '/rejouer');
                                else
                                if(point>3)
                                  point-=3;
                                premier=aleatoire1.nextInt(10);
                                second=aleatoire1.nextInt(10);
                                actualiser();
                                affectation();
                              });
                            }

                          },
                          child: Container(
                            height: 75,
                            width: 105,
                            //color: sequence['color2'].value,
                            decoration:BoxDecoration(
                              color: sequence['color2'].value,
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Text('$container2',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                    ),

                ],
              )
              ),
            /* Container(
               alignment: Alignment.bottomLeft,
               height: 50,
               child: Row(
                 children: <Widget>[
                   Container(
                     height: 70,
                     color: Colors.blue,
                     child: Center(
                         child: Text('$point POINT(S)',style: TextStyle(fontSize: 15,color: Colors.white),)
                     )
                   ),
                   SizedBox(
                     height: 50,
                     width: 50,
                   ),
                   SizedBox(
                     height: 50,
                     width: 50,
                   ),
                   SizedBox(
                     height: 50,
                     width: 50,
                   ),
                   SizedBox(
                     height: 50,
                     width: 30,
                   ),
                   SizedBox(
                     height: 50,
                     width: 50,
                   ),
                   /*Container(

                     height: 70,

                     child: IconButton(icon: Icon(Icons.add,size: 35,color: Colors.blue,), onPressed: null),
                   ),*/
                 ],
               ),
             )*/


            ],
          );

            })
      ),
    );
  }
}