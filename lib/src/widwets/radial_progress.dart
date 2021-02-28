import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final percent;

  const RadialProgress({ this.percent});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
       width: double.infinity,
       height: double.infinity,
       child: CustomPaint(painter: _MiRadialProgress(widget.percent),),
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
