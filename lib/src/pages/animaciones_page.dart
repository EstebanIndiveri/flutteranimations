import 'package:flutter/material.dart';


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

  @override
  void initState() {
    // TODO: implement initState
    controller=new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));
    rotation=Tween(begin: 0.0,end: 2.0).animate(controller);
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
      // child: child,
      builder: (BuildContext context, Widget child) {
        // print('rotation'+rotation.value.toString());
        return Transform.rotate(
          angle: rotation.value,
          child: _Rectangulo());
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
