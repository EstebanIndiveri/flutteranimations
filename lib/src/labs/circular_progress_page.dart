import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double percent=0.0;
  double newPercent=0.0;
  @override
  void initState() { 
    controller=new AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    controller.addListener(() {
      // print('valor controller: ${controller.value}');
      setState(() {
      percent=lerpDouble(percent, newPercent, controller.value);
        
      });
    });
    super.initState();
    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.refresh),
        backgroundColor: Colors.pinkAccent,
        onPressed: (){
          percent=newPercent;
          newPercent+=10;
          if(newPercent>100){
            percent=0;
            newPercent=0;
          }
          controller.forward(from: 0.0);
          setState(() {
          });
        },
      ),
      body:Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(percent),
          ),
          ),
      )
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final percent;
  _MiRadialProgress(this.percent);

  @override
  void paint(Canvas canvas,Size size){
    // Implement
    // Ciclecomplete
    final paint=new Paint()
    ..strokeWidth=4
    ..color=Colors.grey
    ..style=PaintingStyle.stroke;

    Offset center=new Offset(size.width*0.5,size.height/2);

    double radio= min(size.width*0.5,size.height*0.5);

    canvas.drawCircle(center, radio, paint);

    // arc
     final paintArco=new Paint()
    ..strokeWidth=10
    ..color=Colors.pinkAccent
    ..style=PaintingStyle.stroke;

    // in
    double arcAngle=2*pi*(percent/100);

    canvas.drawArc(
      Rect.fromCircle(center: center,radius: radio),
      -pi/2,
      arcAngle, 
      false, 
      paintArco
      );

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>true;


}
