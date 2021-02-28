import 'package:disenos/src/widwets/radial_progress.dart';
import 'package:flutter/material.dart';


class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double percent=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
          percent += 10;
          if(percent > 100){
            percent=0;
          }  
          });
        },),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          // child: Text('$percent %',style: TextStyle(fontSize: 50.0),) ,
          child: RadialProgress(percent:40.0),
        ),
      ),
    );
  }
}