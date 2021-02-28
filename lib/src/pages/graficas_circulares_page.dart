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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(percent: percent,color: Colors.blue,),
              CustomRadialProgress(percent: percent,color:Colors.red,),
            ],),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(percent: percent,color:Colors.pink),
              CustomRadialProgress(percent: percent,color:Colors.green),
            ],)
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    Key key,
    @required this.percent,
    @required this.color,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      // color: Colors.red,
      // child: Text('$percent %',style: TextStyle(fontSize: 50.0),) ,
      child: RadialProgress(
        percent:percent,
        // primaryColor: Colors.purple,
        primaryColor: this.color,
        secondaryColor: Colors.grey,
        weightSecondary: 4,
        weightPrimary: 10,
        ),
    );
  }
}