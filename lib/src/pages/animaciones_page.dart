import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double>rotation;
  Animation<double>opacity;
  @override
  void initState() {
    // TODO: implement initState
    controller=new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));
    rotation=Tween(begin: 0.0,end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller,curve: Curves.slowMiddle)
    );

    opacity=Tween(begin: 0.1,end: 1.0).animate(controller);

    controller.addListener(() {
      print('status: ${controller.status}');
      if(controller.status==AnimationStatus.completed){
        // controller.reverse();
        controller.reset();

      }
    });

    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // play
    controller.forward();
    // return _Rectangulo();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        // print('rotation'+rotation.value.toString());
        return Transform.rotate(
          angle: rotation.value,
          child: Opacity(
          opacity: opacity.value,
          child: childRectangulo,
          )
          );
      },
    );
  }
}




class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}
