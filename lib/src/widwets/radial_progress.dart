import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double weightSecondary;
  final double weightPrimary;

  const RadialProgress({ 
    @required this.percent, 
    this.primaryColor=Colors.blueGrey,
    this.secondaryColor=Colors.amber, 
    this.weightSecondary=4,
    this.weightPrimary=10,
    });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percentBefore;
  @override
  void initState() { 
    percentBefore=widget.percent;
    controller=new AnimationController(vsync: this,duration: Duration(milliseconds: 200));

    super.initState();
    
  }
  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final differAnimation=widget.percent-percentBefore;
    percentBefore=widget.percent;

    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext context,Widget child){
      return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(painter: _MiRadialProgress((widget.percent - differAnimation)+(differAnimation*controller.value)
          ,widget.primaryColor,
          widget.secondaryColor,
          widget.weightSecondary,
          widget.weightPrimary,
          ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double weightSecondary;
  final double weightPrimary;

  _MiRadialProgress(
    this.percent,
    this.primaryColor,
    this.secondaryColor, 
    this.weightSecondary, 
    this.weightPrimary,
    );

  @override
  void paint(Canvas canvas,Size size){
    // Implement
    final Rect rect=new Rect.fromCircle(
      center: Offset(0,0),
      radius: 180
    );
    final Gradient gradiente=new LinearGradient(colors: <Color>[
    Color(0xffc012FF),
    Color(0xff6d05e8),
    Colors.red
    ]);
    // Ciclecomplete
    final paint=new Paint()
    ..strokeWidth=weightSecondary
    ..color=secondaryColor
    ..style=PaintingStyle.stroke;

    Offset center=new Offset(size.width*0.5,size.height/2);

    double radio= min(size.width*0.5,size.height*0.5);

    canvas.drawCircle(center, radio, paint);

    // arc
     final paintArco=new Paint()
    ..strokeWidth=weightPrimary
    // ..color=primaryColor
    ..shader=gradiente.createShader(rect)
    ..strokeCap=StrokeCap.round
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
