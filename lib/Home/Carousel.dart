import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex=0;
  List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card){
                return Builder(
                    builder:(BuildContext context){
                      return Container(
                        height: MediaQuery.of(context).size.height*0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Colors.blueAccent,
                          child: card,
                        ),
                      );
                    }
                );
              }).toList(),
            ),
            Row(
              children: <Widget>[
                Text("data")
              ],
            )
          ],
        )
    );
  }

  class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return Container(
  decoration: BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.3, 1],
  colors: [Color(0xffff4000),Color(0xffffcc66),]
  ),
  ),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Text(
  "Data",
  style: TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontWeight: FontWeight.bold
  )
  ),
  Text(
  "Data",
  style: TextStyle(
  color: Colors.white,
  fontSize: 17.0,
  fontWeight: FontWeight.w600
  )
  ),
  ],
  ),
  );
  }
  }
}
class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }
}
