import 'file:///F:/New%20Folder%20(2)/flutter%20projects/consule_medical_store/lib/Products/Cart.dart';
import 'package:consule_medical_store/Home/Address.dart';
import 'package:consule_medical_store/Home/Home.dart';
import 'package:consule_medical_store/Home/Profile.dart';
import 'package:consule_medical_store/Products/Favorte.dart';
import 'package:consule_medical_store/Products/product_details.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:consule_medical_store/Home/Search_Bar.dart';
import 'package:consule_medical_store/Home/Upload_Prescription.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
class Product_List extends StatefulWidget {
  @override
  _Product_ListState createState() => _Product_ListState();
}
class _Product_ListState extends State<Product_List> {
  List productdata;
  bool isproductloading = true;

  List bannerdata ;


   initState(){
    getProductData();
    super.initState();
  }

  getProductData() async {
    await Auth_services.getProduct().then((onValue){
      if(onValue['response_code'] == 200){
        if(mounted){
          setState(() {
            isproductloading = false;
          });
        }
        productdata = onValue['response_data'];
      }
      else{
        isproductloading = true;
        return
          print(onValue['response_data']);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: DrawerList(),
      appBar: Appbar(),
      body:
      SingleChildScrollView(
      child:Center(
        child: Container(
          height: height,
          width: width/1.2,
          child: isproductloading == true? GFLoader(type: GFLoaderType.ios,):
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: productdata.length,
            itemBuilder: (BuildContext context ,int index) {
              print(productdata[index]['title']);
              return
                InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>Product_Details(imageUrl: productdata[index]['imageUrl'], about : productdata[index]['description'],title :productdata[index]['title'],category:productdata[index]['category'], code : productdata[index]['objectID'],productstock: productdata[index]["variant"][0]['productstock'],price: productdata[index]["variant"][0]['price'])));},
                  child:
                  Container(
                    width: width/1.1,
                    child:
                    ListTile(
                      title:
                      Padding(
                        padding: const EdgeInsets.only(left:5,right: 10),
                        child: Container(
                          width: width/2,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: Text("${productdata[index]['title']}",style: TextStyle(color: Colors.black,fontSize: 18))),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
                                  child: Container(
                                    height: height/4,
                                    child: Image.network("${productdata[index]['imageUrl']}"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
                                  child: Container(
                                    height: height/50,
                                    width: width/1.4,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
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
                                            Text("${productdata[index]['variant'][0]['productstock']}",style: TextStyle(color: Colors.black)),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text("Category : ",style: TextStyle(color: Colors.black45)),
                                      Text("${productdata[index]['title']}",style: TextStyle(color: Colors.black,fontSize: 18)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Text("Price : ",style: TextStyle(color: Colors.black45)),
                                      Text("${productdata[index]['variant'][0]['price']}",style: TextStyle(color: Colors.black,fontSize: 15)),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          FlatButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(18.0),
                                                  side: BorderSide(color: Colors.black12)
                                              ),
                                              height: 30,
                                              minWidth: 40,
                                              color: Colors.red,
                                              onPressed:()=> setState(()=>FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(18.0),
                                                      side: BorderSide(color: Colors.black12)
                                                  ),
                                                  height: 30,
                                                  minWidth: 40,
                                                  color: Colors.red,
                                                  onPressed: null, child: Text(" Go to Cart", style: TextStyle(color: Colors.white)))) ,
                                              child:
                                              Text("+ add to bag ", style: TextStyle(color: Colors.white))),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

            },
          ),
        ),
      )
    ));
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

