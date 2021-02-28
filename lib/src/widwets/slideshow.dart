import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/models/slider_model.dart';
// TODO BORRAR?
// import 'package:flutter_svg/flutter_svg.dart';

class Slideshow extends StatelessWidget {
  final List<Widget>slides;
  final bool dotsHeight;
  final Color primarycolor;
  final Color secondarycolor;

  Slideshow({
    @required this.slides,
    this.dotsHeight=false, 
    this.primarycolor=Colors.black, 
    this.secondarycolor=Colors.grey,
    });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>new SliderModel(),
      child: SafeArea(
              child: Center(
            // child:SvgPicture.asset('assets/svg/slide-1.svg')
            // child:SvgPicture.asset('assets/svg/slide-1.svg')
            child:Column(
              children: <Widget>[
                if(this.dotsHeight)
                _Dots(this.slides.length,this.primarycolor,this.secondarycolor),
                  Expanded(
                   child: _Slides(this.slides)
                    ),
                    if(!this.dotsHeight)
                    _Dots(this.slides.length,this.primarycolor,this.secondarycolor),
              ],
              )// child:Text('hola')
            ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides; 
  final Color primaryColor;
  final Color secondaryColor;

  _Dots(
    this.totalSlides,
    this.primaryColor,
    this.secondaryColor,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color:Colors.red,
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: <Widget>[
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2)

        // ],
        children: List.generate(this.totalSlides, (i) => _Dot(i,this.primaryColor,this.secondaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final int index;

  _Dot(this.index, this.primaryColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex=Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(microseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex>=index - 0.5 && pageViewIndex < index + 0.5)
        ?this.primaryColor:this.secondaryColor,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget>slides;
  
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController=new PageController();

  @override
  void initState() { 
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context,listen: false).currentPage=pageViewController.page;
    });
    
  }
  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide('assets/svg/slide-1.svg'),
        //   _Slide('assets/svg/slide-2.svg'),
        //   _Slide('assets/svg/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      // child: SvgPicture.asset(svg),
      child: slide,
    );
  }
}