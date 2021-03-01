import 'package:flutter/material.dart';
import 'package:disenos/src/widwets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.purple,
      body: Slideshow(
        dotsHeight: true,
        secondarycolor: Colors.grey,
        primarycolor: Colors.red,
        slides: <Widget>[
           SvgPicture.asset('assets/svg/slide-1.svg'),
           SvgPicture.asset('assets/svg/slide-2.svg'),
           SvgPicture.asset('assets/svg/slide-3.svg'),
           SvgPicture.asset('assets/svg/slide-4.svg'),
           SvgPicture.asset('assets/svg/slide-5.svg'),
          
        ],
      ),
    );
  }
}