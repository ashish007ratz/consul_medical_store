import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  List cardList = [
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];

  List ProductList = [
    Product1(),
    Product2(),
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
        body: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 190.0,
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
              items: cardList.map((card) {
                return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height ,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                  ),
                );
              }),
            ),
            Container(
              child: Column(
                   children: <Widget>[
                        CarouselSlider(
                           options: CarouselOptions(
                      height: 450.0,
                      autoPlay: false,
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
                            items: ProductList.map((card) {
               return Builder(
                      builder: (BuildContext context) {
              return Container(
                         height: MediaQuery.of(context).size.height ,
                         width: MediaQuery.of(context).size.width,
                   child: Card(
                        color: Colors.white,
                     child: card,
                ),
                );
                }
                  );
                }).toList(),
                ),
               //        Row(
               //      mainAxisAlignment: MainAxisAlignment.center,
               // children: map<Widget>(cardList, (index, url) {
               // return Container(
               //    width: 10.0,
               // height: 10.0,
               // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
               // decoration: BoxDecoration(
               // shape: BoxShape.circle,
               // color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
               //  ),
               //  );
               // }),
               //     ),
                   ],
              ),
            )
          ],
        ),

    );
  }

}
class Item1 extends StatefulWidget {
  const Item1({Key key}) : super(key: key);
  @override
  _Item1State createState() => _Item1State();
}

class _Item1State extends State<Item1> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'lib/assets/images/Active (3).png');

        //   Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white
    //   ),
    //   child: Column(
    //     children: <Widget>[
    //       Image.asset(
    //         'lib/assets/images/Active (3).png',
    //
    //         fit: BoxFit.cover,
    //       )
    //     ],
    //   ),
    // );
  }
}
class Item2 extends StatefulWidget {
  const Item2({Key key}) : super(key: key);
  @override
  _Item2State createState() => _Item2State();
}

class _Item2State extends State<Item2> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'lib/assets/images/Active(6).png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],

      ),
    );
  }
}

class Item3 extends StatefulWidget {
  const Item3({Key key}) : super(key: key);
  @override
  _Item3State createState() => _Item3State();
}

class _Item3State extends State<Item3> {
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
          Image.asset(
            'lib/assets/images/Active (4).png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
class Item4 extends StatefulWidget {
  const Item4({Key key}) : super(key: key);
  @override
  _Item4State createState() => _Item4State();
}

class _Item4State extends State<Item4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      Image.asset(
      'lib/assets/images/Active (5).png',
        height: 180.0,
        fit: BoxFit.cover,
      )
        ],
      ),
    );
  }
}
class Product1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
              ),
              height: 23,
              child: Column(
                children: [
                  Container(
                    child: Text("Top selling medicines in India" ),
                  ),
                ],
              ),
            ),
          ),
         Padding(padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
          child:
          Image.asset("lib/assets/images/product2.png"),
         ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:75),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 20,
                width: 260,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 280, 30, 30),
            child: Container(
              child: Row(
                children: [
                  Text("Sold : ",style: TextStyle(color: Colors.black45)),
                  Text("150",style: TextStyle(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text("Available : ",style: TextStyle(color: Colors.black45)),
                  ),
                  Text("300",style: TextStyle(color: Colors.black)),
                                  ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 310, 30, 30),
            child: Container(child: Text("Category : ",style: TextStyle(color: Colors.black45))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 330, 30, 30),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(child: Text("Manual Oxygen Device",style: TextStyle(color: Colors.black,fontSize: 17))),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 360, 30, 30),
            child: Container(
              child: Row(
                children: [
                    Text("150 INR",style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(160, 350, 30, 30),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black12)
                ),
                height: 30,
                minWidth: 100,
                color: Colors.red,
                onPressed:()=>Splash_Screen ,
                child:
                Text("+ add to bag ", style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
class Product2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 23,
              child: Column(
                children: [
                  Container(
                    child: Text("Top selling medicines in India" ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
            child:
            Image.asset("lib/assets/images/product2.png"),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:75),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 20,
                width: 260,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 280, 30, 30),
            child: Container(
              child: Row(
                children: [
                  Text("Sold : ",style: TextStyle(color: Colors.black45)),
                  Text("150",style: TextStyle(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text("Available : ",style: TextStyle(color: Colors.black45)),
                  ),
                  Text("300",style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 310, 30, 30),
            child: Container(child: Text("Category : ",style: TextStyle(color: Colors.black45))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 330, 30, 30),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(child: Text("Manual Oxygen Device",style: TextStyle(color: Colors.black,fontSize: 17))),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 360, 30, 30),
            child: Container(
              child: Row(
                children: [
                  Text("150 INR",style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(160, 350, 30, 30),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black12)
                ),
                height: 30,
                minWidth: 100,
                color: Colors.red,
                onPressed:()=>Splash_Screen ,
                child:
                Text("+ add to bag ", style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
