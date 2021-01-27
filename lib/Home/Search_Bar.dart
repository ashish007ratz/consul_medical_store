import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:flutter/material.dart';
import 'file:///F:/New%20Folder%20(2)/flutter%20projects/consule_medical_store/lib/Products/Cart.dart';
import 'package:consule_medical_store/Home/Upload_Prescription.dart';
class Search_Bar extends StatefulWidget {
  @override
  _Search_BarState createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  String search;
  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      endDrawer: DrawerList(),
      appBar: Appbar(),
      body: Search_Content(),
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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Upload_Prescription()));
          },
          child:Row(
            children:[
              Text("Upload Prescription", style:
              TextStyle(color: Colors.white))],),),
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
                MaterialPageRoute(builder: (context) =>Shopping_Cart()),
              );
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
  Widget Search_Content(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: TextFormField(
        controller: SearchController,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter Product name";
          } else
            return null;
        },
        onSaved: (String value) {
          search = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)),
          hintText: "Search your product ",
          contentPadding:
          new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          labelText: "Search here",
        ),
      ),
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
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.card_travel_outlined,color: Colors.black,) ,
            title: Text('Cart',style: TextStyle(color: Colors.black),),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
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
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,color: Colors.red) ,
            title: Text('Favorite',style: TextStyle(color: Colors.black),),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: height / 3.4,
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
}
