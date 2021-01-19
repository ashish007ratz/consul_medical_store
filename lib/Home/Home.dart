import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  final String title;
  Home({Key key, this.title}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      endDrawer: Drawer(
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
      ),
      appBar: AppBar(
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
      ),
      body: Container(
        padding: EdgeInsets.all(16),
      child: Align(
      alignment: Alignment.topCenter,
      child: Banner(
        location: BannerLocation.topEnd,
        color: Colors.red,
        child: Container(
          height: 200,
          width: 200,
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      ),
    ));
  }
  Widget UploadPrescription(){

  }
}


