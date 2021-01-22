import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
class Home extends StatefulWidget {
  @override
  final String title;
  Home({Key key, this.title}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      endDrawer: DrawerList(),
      appBar: Appbar(),
    //   body: Container(
    //     padding: EdgeInsets.all(16),
    //   child: Align(
    //   alignment: Alignment.topCenter,
    //   child: Banner(
    //     location: BannerLocation.topEnd,
    //     color: Colors.red,
    //     child: Container(
    //       height: 200,
    //       width: 200,
    //       child: Image.network(
    //         'https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg',
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    //   ),
    // )
               body:  SingleChildScrollView(
                child: Container(
             width: width,
               child: Column(
               children: <Widget>[
                      carousel(),
                      Container(
                          child: Column(
                  children: <Widget>[
                     ]         ,
                ),
                             ),
                      Padding(
                             padding: const EdgeInsets.all(15.0),
                         child: BrandLogo(),
                     ),
                    Padding(
                           padding: const EdgeInsets.all(8.0),
                        child: Reviews(),
                       ),
                        ContactUs(),
                       ],
                         ),
                ),
               )
    );
  }
    Widget DrawerList(){
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
    }
    Widget Appbar(){
    return AppBar(
      backgroundColor: Colors.white,
      leading: Image(
        image:AssetImage("lib/assets/images/logo.png"),
        height:70,
        width: 70,
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          onPressed: UploadPrescription,
          child:Row(
            children:[
              Text("Upload Prescription", style:
              TextStyle(color: Colors.white))],),),
        FlatButton(
          height: 50,
          minWidth: 10,
          onPressed: UploadPrescription,
          child:  Icon(Icons.search_rounded),),
        FlatButton(
          height: 50,
          minWidth: 10,
          onPressed: UploadPrescription,
          child:  Icon(Icons.card_travel_outlined),),
        Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(Icons.ac_unit,color: Colors.black,),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),),
      ],
    );
    }
    Widget carousel(){
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height/4,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,

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
                  child: card,
                ),
              );
            }
        );
      }).toList(),
    );
    }
    Widget BrandLogo(){
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/3,
      color: Colors.white,
      child: Container(
        child: GridView.count(
          crossAxisSpacing: 2,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
        return Container(
          margin: EdgeInsets.all(0),
          child: Image.asset("lib/assets/images/logo.png",fit: BoxFit.cover,),
        );
    }
        ),
        ),
      ));
    }
    Widget Reviews(){
    return Container(
      height: 400,
      width: 400,
      child: Stack(
        children:[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("We love our clients.",style: TextStyle(fontSize: 25),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: 350 ,
              width: 350,
              decoration: new BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),

              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("data"),
              ) ,
            ),
          )
        ],
      ),

    );
    }
    Widget ContactUs(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height:height/6,
      width: width,
        decoration: new BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      )),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Container(
              child:Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Mail : support@gmail.com"),
                  SizedBox(
                  height:10 ,
                  ),
                  Text("Phone :+91 8126940910"),
                  SizedBox(
                    height:10 ,
                  ),
                  Text("Share location : 219 Amara fort Apt. 394"),
                ],
            ),
              ),
          ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
            child: Container(
              height: height/8,
                child:
            Image.asset("lib/assets/images/logo.png")),
          ),
        ],
      ),
    );
    }
  UploadPrescription(){

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            height: 180,
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
            Image.asset("lib/assets/images/product1.png"),
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



