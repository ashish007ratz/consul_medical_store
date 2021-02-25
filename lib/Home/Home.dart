import 'package:consule_medical_store/Home/Address.dart';
import 'package:consule_medical_store/Home/Profile.dart';
import 'package:consule_medical_store/Products/Cart.dart';
import 'package:consule_medical_store/Products/Favorte.dart';
import 'package:consule_medical_store/Products/Product_List.dart';
import 'package:consule_medical_store/Products/product_details.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:consule_medical_store/Home/Search_Bar.dart';
import 'package:consule_medical_store/Home/Upload_Prescription.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  @override
  final String title;
  Home({Key key, this.title, token}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _volume = 1;
  List bannerdata;
  bool isbannerloading = true;
  List productdeal;
  List variant;
  bool isproductloading = true;
  List category;
  bool iscategoryloading = true;


   initState(){
    getBannerData();
    getProductData();
    getCatogeryList();
    super.initState();
  }

  List ProductList = [
    Product1(),
    Product2(),
  ];
  getBannerData() async {
    await Auth_services.getBanner().then((value){
      if(value['response_code'] == 200){
        if(mounted){
          setState(() {
            isbannerloading = false;
          });
        }

        bannerdata = value['response_data']['banners'];
      }
      else{
        isbannerloading = true;
      }
    });
  }

  getProductData() async {
    await Auth_services.getProduct().then((onValue){
      if(onValue['response_code'] == 200){
        if(mounted){
          setState(() {
            isproductloading = false;
          });
        }
        productdeal = onValue['response_data'];
        variant = onValue['response_data'][0]['variant'];
        print("product list is  === ${productdeal}");
      }
      else{
        isproductloading = true;
        return
        print(onValue['response_data']);
      }
    });
  }

  getCatogeryList() async {
    await Auth_services.getCategory().then((value){
      if(value['response_code'] == 200){
        if(mounted){
          setState(() {
            iscategoryloading = false;
          });
        }
         category= value['response_data'];
      }
      else{
        iscategoryloading = true;
      }
    });
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
                        Container
                          (
                          height: height/3.5,
                          width: width,
                          child: isbannerloading == true? GFLoader(type: GFLoaderType.ios,) : Carousel(
                            showIndicator: false,
                            boxFit: BoxFit.cover,
                            dotBgColor: Colors.transparent,
                            images: bannerdata.map((url){
                              return Image.network("${url['imageURL']}");
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
                        Container(

                          height:height/2 ,
                          width: width,
                          child: ProductDeal(),
                        ),
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
              Navigator.push(
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

    Widget ProductDeal(){
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
    return isproductloading == true? GFLoader(type: GFLoaderType.ios,):
    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productdeal.length,
      itemBuilder: (BuildContext context ,int index) {
        print(productdeal[index]['title']);
        return
          InkWell(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder:
                (context)=>Product_Details(imageUrl: productdeal[index]['imageUrl'], about : productdeal[index]['description'],title :productdeal[index]['title'],category:productdeal[index]['category'], code : productdeal[index]['objectID'],productstock: productdeal[index]["variant"][0]['productstock'],price: productdeal[index]["variant"][0]['price'])));},
            child:
            Container(
              width: width/1.2,
              child:
              ListTile(
                title:
                Container(
                  height: height/2.3,
                  width: width/2,
                  decoration: BoxDecoration(
                    boxShadow:[BoxShadow(
                        color:Colors.black12
                    )]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.network("${productdeal[index]['imageUrl']}"),
                          height: height/4,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              )
                      ),
                      FractionalTranslation(
                        translation: Offset(0, -0.44),
                        child: Container(
                          width: 160,
                          height: 40,
                          child: Center(
                              child: Text(
                                "${productdeal[index]['title']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 5, color: Colors.white)),
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0, -1),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width/11,
                            ),
                            Text(
                              "Available  :",
                              style: TextStyle(
                                  color: Colors.black12,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              "${productdeal[index]['variant'][0]['productstock']}",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: width/6.3,
                            ),
                            IconButton(
                              icon: Icon(Icons.minimize,color: Colors.greenAccent),
                              tooltip: '-',color: Colors.redAccent,
                              onPressed: () {
                                setState(() {
                                  if(_volume != 1 )
                                    return{_volume -= 1};
                                  else{
                                    return _volume ==1;
                                  }
                                });
                              },
                            ),
                            Text('  $_volume',style: TextStyle(color: Colors.black),),
                            IconButton(
                              icon: Icon(Icons.add,color: Colors.redAccent,),
                              onPressed: () {
                                setState(() {
                                  if(_volume == productdeal[index]['variant'][0]['productstock'])
                                  {return AlertDialog(
                                    title: Text("Please Check Available Stock"),
                                    actions: [
                                      FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("ok"))
                                    ],
                                  );}
                                  else {
                                    return  _volume += 1;
                                  }

                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

      },
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
        Container(
          height: height/30,
          child: InkWell( onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Upload_Prescription()),
            );
          },
              child: Container(
            width:width/2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.red,
            ),
            child: Center(child:
            Text('Upload Prescription',style: TextStyle(color: Colors.white))),
          )),
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


    Widget BrandLogo(){
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/2,
      color: Colors.white,
      child: Container(
        // child: GridView.count(
        //   crossAxisSpacing: 2,
        //   mainAxisSpacing: 0,
        //   crossAxisCount: 2,
        //   children: <Widget> [
        //     iscategoryloading == true ? GFLoader(type: GFLoaderType.ios,): category.map((cat){
        //       return Image.network("${cat['imageUrl']}");
        //     }).toList(),
        //   ],
        // ),
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



