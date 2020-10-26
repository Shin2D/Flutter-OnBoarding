import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'HomePage.dart';

import 'data/data.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Onboarding",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 :6.0,
      decoration: BoxDecoration(
        color: isCurrentPage? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
          itemCount: slides.length,
            onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
            },
          itemBuilder: (context, index){
           return SliderTile(
               imageAssetPath: slides[index].getImageAssetPath(),
               title: slides[index].getTitle(),
               desc: slides[index].getDesc(),
           );
          }),
      bottomSheet: currentIndex != slides.length -1 ? Container(
        color: Colors.white,
        height: Platform.isAndroid ? 50 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: ()
              {pageController.animateToPage(slides.length -1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text("SKIP")

            ),
            Row(
              children: <Widget>[
                for(int i = 0; i < slides.length; i++)
                  currentIndex == i ?pageIndexIndicator(true): pageIndexIndicator(false)

              ],
            ),
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text("NEXT")
              ),
            ],
        ),
      ) :
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child:
        Container(
          alignment: Alignment.center,
          height: Platform.isAndroid ? 50 : 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.deepPurple,
          child:
          Text("GET STARTED",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800
            ),
          ),
        ),
      ),

    );
  }
}

class SliderTile extends StatelessWidget {

  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          SizedBox(height: 20,),
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 12,),
          Text(desc, textAlign: TextAlign.center,
            style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 16,
          ),),
        ],
      ),
    );
  }
}

