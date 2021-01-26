import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:consule_medical_store/Home/Upload_Prescription.dart';
import 'package:flutter/material.dart';
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
            leading: Icon(Icons.info,color: Colors.black,) ,
            title: Text('About us',style: TextStyle(color: Colors.black),),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: height / 2.3444,
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
  Widget UploadPrescription (){
       Container(
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
                height: height / 30,
              ),
              Container(
                height: height/4,
                child: Image.asset("lib/assets/images/product1.png"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 20,
                width: 260,
              ),
              Row(
                children: [
                  Text("Sold : ",style: TextStyle(color: Colors.black45)),
                  Text("150",style: TextStyle(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Text("Available : ",style: TextStyle(color: Colors.black45)),
                  ),
                  Text("300",style: TextStyle(color: Colors.black)),
                ],
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
                          minWidth: 100,
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
