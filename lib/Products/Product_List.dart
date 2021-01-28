import 'file:///F:/New%20Folder%20(2)/flutter%20projects/consule_medical_store/lib/Products/Cart.dart';
import 'package:consule_medical_store/Home/Address.dart';
import 'package:consule_medical_store/Home/Home.dart';
import 'package:consule_medical_store/Home/Profile.dart';
import 'package:consule_medical_store/Products/Favorte.dart';
import 'package:flutter/material.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:consule_medical_store/Home/Search_Bar.dart';
import 'package:consule_medical_store/Home/Upload_Prescription.dart';
class Product_List extends StatefulWidget {
  @override
  _Product_ListState createState() => _Product_ListState();
}
class _Product_ListState extends State<Product_List> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: DrawerList(),
      appBar: Appbar(),
      body:Container(
        height: height/2,
        width: width/1.2,
        child: ListView(
          children: [
            Product2(),
            Product1()
          ],
        )
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Splash_Screen()));
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

}

