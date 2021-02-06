import 'package:consule_medical_store/Home/Address.dart';
import 'package:consule_medical_store/Home/Profile.dart';
import 'package:consule_medical_store/Products/Cart.dart';
import 'package:consule_medical_store/Products/Favorte.dart';
import 'package:consule_medical_store/Products/Product_List.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:consule_medical_store/Home/Search_Bar.dart';
import 'package:consule_medical_store/Home/Upload_Prescription.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  final String title;
  Home({Key key, this.title, token}) : super(key: key);
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
      backgroundColor: Colors.white,
      endDrawerEnableOpenDragGesture: true,
      endDrawer: DrawerList(),
      appBar: Appbar(),
               body:  SingleChildScrollView(
                child: Container(
             width: width,
                    child: Column(
                      children: <Widget>[
                        Text("${'userId'}"),
                        carousel(),
                        SizedBox(
                          height: height / 30,
                        ),
                        Product(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ProductListButton(),
                        ],
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
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: height / 30,
          ),
          Material(
            child:InkWell(onTap: (){},
              child: Column(
                children: [
                  Container(
                      height: height/5,
                      width: width,

                      child:CircleAvatar( backgroundImage: AssetImage("lib/assets/images/logo.png")
                      ),
          ),
                  Text("Ashish Raturi",style: TextStyle(color: Colors.black)),
                ],
              ),
            )),
          SizedBox(
            height: height / 30,
          ),
          ListTile(
            leading: CircleAvatar(
             backgroundImage: AssetImage("lib/assets/images/logo.png"),
            ),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>Profile_Data()));
            },
          ),
          ListTile(
            leading: Icon(Icons.card_travel_outlined,color: Colors.black,),
            title: Text('Cart',style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shopping_Cart()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_moderator,color: Colors.black,) ,
            title: Text('My Order',style: TextStyle(color: Colors.black),),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.home_work_outlined,color: Colors.black),
            title: Text('Address'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => User_address()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,color: Colors.red) ,
            title: Text('Favorite',style: TextStyle(color: Colors.black),),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorte_items()));
            },
          ),
          SizedBox(
            height: height/4,
          ),

          ListTile(
            leading: Icon(Icons.logout,color: Colors.black,) ,
            title: Text('Logout',style: TextStyle(color: Colors.black),),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.setString('email', null);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext) => Splash_Screen()));
            },
          ),
        ],
      ),
    );
    }
    Widget Appbar(){
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      leading: Image(
        image:AssetImage("lib/assets/images/logo.png"),
        height:100,
        width:100,
      ),
      actions: <Widget>[
        new SizedBox(
          width: width/2.5,
          height: height/20,
          child: new RaisedButton(
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            child: new Text('Upload Prescription',style: TextStyle(color: Colors.white)),
              onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Upload_Prescription()));
                  },
          ),
        ),
        FlatButton(
          height: 50,
          minWidth: 10,
          child:  Icon(Icons.search_rounded),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Search_Bar()),
            );
          }),
        FlatButton(
          height: 50,
          minWidth: 10,
            child:  Icon(Icons.card_travel_outlined),
          onPressed: (){
      Navigator.push(
      context,
             MaterialPageRoute(builder: (context) => Shopping_Cart()),);
          }
          ),
        Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(Icons.ac_unit,color: Colors.black,),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),),
      ],
    );
    }
    Widget Product(){
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/2,
      width:width/1.2,
      child: ListView(
        children: [

          Product1(),
          Product2(),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
    }
    Widget ProductListButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
          TextButton(
            child:
            Text('View More',style: TextStyle(color: Colors.red, fontWeight:FontWeight.w200),),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Product_List()));
            },)],);
    }
    Widget carousel(){
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height/3.8,
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
                height: MediaQuery.of(context).size.height,
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
            fit: BoxFit.fitHeight,
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red)
      ),
      height: height/2,
      width: width/1.2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: height/4,
                child: Image.asset("lib/assets/images/product2.png"),
              ),
              Container(
                height: height/50,
                width: width/1.2,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: height/30,
                width: width/1.2,
                child: Row(
                  children: [
                    Text("Sold : ",style: TextStyle(color: Colors.black45)),
                    Text("150",style: TextStyle(color: Colors.black)),
                    SizedBox(
                      width: width/4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Available : ",style: TextStyle(color: Colors.black45)),
                        Text("300",style: TextStyle(color: Colors.black)),
                      ],
                    ),

                  ],
                ),
              ),
              Text("Category",style: TextStyle(color: Colors.black45)),
              Text("Disposable Hand Wash Gel",style: TextStyle(color: Colors.black,fontSize: 18)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text("150 INR",style: TextStyle(color: Colors.black,fontSize: 15)),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black12)
                          ),
                          height: 30,
                          minWidth: 40,
                          color: Colors.red,
                          onPressed:()=>Splash_Screen ,
                          child:
                          Text("+ add to bag ", style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Product2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red)
      ),
      height: height/2,
      width: width/1.2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: height /90,
              ),
              Container(
                height: height/4,
                child: Image.asset("lib/assets/images/product1.png"),
              ),
              Container(
                height: height/50,
                width: width/1.2,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: height/30,
                width: width/1.2,
                child: Row(
                  children: [
                    Text("Sold : ",style: TextStyle(color: Colors.black45)),
                    Text("150",style: TextStyle(color: Colors.black)),
                    SizedBox(
                      width: width/4,
                    ),
                    Text("Available : ",style: TextStyle(color: Colors.black45)),
                    Text("300",style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Text("Category",style: TextStyle(color: Colors.black45)),
              Text("Disposable Hand Wash Gel",style: TextStyle(color: Colors.black,fontSize: 18)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text("150 INR",style: TextStyle(color: Colors.black,fontSize: 15)),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black12)
                          ),
                          height: 30,
                          minWidth: 40,
                          color: Colors.red,
                          onPressed:()=>Splash_Screen ,
                          child:
                          Text("+ add to bag ", style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



