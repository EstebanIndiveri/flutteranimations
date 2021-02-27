import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>with SingleTickerProviderStateMixin {

  AnimationController controller;
  // animations
  Animation<double>moveRight;
  Animation<double>moveTop;
  Animation<double>moveLeft;
  Animation<double>moveDown;


  @override
  void initState() {
    // TODO: implement initState
    controller=new AnimationController(vsync: this,duration:Duration(milliseconds: 4500));
    moveRight=Tween(begin: 0.0,end: 100.0).animate(
      CurvedAnimation(parent: controller,curve: Interval(0.0,0.25,curve:Curves.bounceOut))
    );
    moveTop=Tween(begin: 0.0,end:-100.0).animate(
      CurvedAnimation(parent: controller,curve: Interval(0.25,0.50,curve:Curves.bounceOut),)
    );
    moveLeft=Tween(begin: 0.0,end: -100.0).animate(
      CurvedAnimation(parent: controller,curve: Interval(0.50,0.75,curve:Curves.bounceOut))
    );
    moveDown=Tween(begin: 0.0,end:100.0).animate(
      CurvedAnimation(parent: controller,curve: Interval(0.75,1.0,curve:Curves.bounceOut),)
    );
    controller.addListener(() { 
      if(controller.status==AnimationStatus.completed)controller.reset();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moveRight.value+moveLeft.value,moveTop.value+moveDown.value),
          child: childRectangulo
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