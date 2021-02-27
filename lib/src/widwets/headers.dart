import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
      color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70),bottomRight: Radius.circular(70))
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ),
      );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,  Size size) {
      // TODO: implement paint
      final paint=new Paint();
      //properties
      paint.color=Color(0xff615AAB);
      paint.style=PaintingStyle.fill;
      paint.strokeWidth=2;
      final path=new Path();
      // Path y paint
      path.moveTo(0, size.height*0.35);
      path.lineTo(size.width, size.height*0.30);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      // path.lineTo(0, size.height*0.5);

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter:_HeaderTriangularPainter(),
        ),
      );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,  Size size) {
      // TODO: implement paint
      final paint=new Paint();
      //properties
      paint.color=Color(0xff615AAB);
      paint.style=PaintingStyle.fill;
      paint.strokeWidth=2;
      final path=new Path();
      // Path y paint
      path.moveTo(0, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      // path.lineTo(0, size.height*0.5);

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }
}
class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter:_HeaderPicoPainter(),
        ),
      );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,  Size size) {
      // TODO: implement paint
      final paint=new Paint();
      //properties
      paint.color=Color(0xff615AAB);
      paint.style=PaintingStyle.fill;
      paint.strokeWidth=2;
      final path=new Path();
      // Path y paint
      path.lineTo(0, size.height*.25);
      path.lineTo(size.width*0.5, size.height*0.30);
      path.lineTo(size.width, size.height*.25);
      path.lineTo(size.width,0);
      
      

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter:_HeaderWavePainter(),
        ),
      );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas,  Size size) {
      // TODO: implement paint
      final paint=new Paint();
      //properties
      paint.color=Color(0xff615AAB);
      paint.style=PaintingStyle.fill;
      paint.strokeWidth=2;
      final path=new Path();
      // Path y paint
      path.lineTo(0, size.height*.25);
      path.quadraticBezierTo(size.width*0.25, size.height*0.30,size.width*0.5, size.height*.25);
      path.quadraticBezierTo(size.width*0.75, size.height*0.20,size.width, size.height*.25);
      path.lineTo(size.width,0);
      // path.lineTo(size.width, 0);
      // path.lineTo(size.width, size.height*.25);
      
      

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }
}
// otro

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter:_HeaderCurvoPainter(),
        ),
      );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,  Size size) {
      // TODO: implement paint
      final paint=new Paint();
      //properties
      paint.color=Color(0xff615AAB);
      paint.style=PaintingStyle.fill;
      paint.strokeWidth=2;
      final path=new Path();
      // Path y paint
      path.lineTo(0, size.height*.20);
      path.quadraticBezierTo(size.width*0.50, size.height*0.40,size.width, size.height*.20);
      path.lineTo(size.width, 0);
      // path.lineTo(size.width, size.height*.25);
      
      

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }
}

class HeaderGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(
          painter:_HeaderGradientPainter(),
        ),
      );
  }
}

class _HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,  Size size) {
      // TODO: implement paint

      final Rect rect=new Rect.fromCircle(
        center:Offset(150.0,55.0),
        radius: 300
      );

      final Gradient gradiente=new LinearGradient(
        colors:<Color>[
        Color(0xff615AAB),
        Color(0xffC012FF),
        Color(0xff6d05fa),
      ],
      stops: [
        0.0,
        0.5,
        1.0,
      ]
      );
      final paint=new Paint()..shader=gradiente.createShader(rect);

      //properties
      // paint.color=Color(0xff615AAB);
      paint.style=PaintingStyle.fill;
      paint.strokeWidth=2;
      final path=new Path();
      // Path y paint
      path.lineTo(0, size.height*.25);
      path.quadraticBezierTo(size.width*0.25, size.height*0.30,size.width*0.5, size.height*.25);
      path.quadraticBezierTo(size.width*0.75, size.height*0.20,size.width, size.height*.25);
      path.lineTo(size.width,0);
      // path.lineTo(size.width, 0);
      // path.lineTo(size.width, size.height*.25);
      
      

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }
}