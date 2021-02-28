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
        child: Text('$percent %',style: TextStyle(fontSize: 50.0),) ,
      ),
    );
  }
}