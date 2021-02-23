import 'package:flutter/material.dart';
class Product_Details extends StatefulWidget {
  final imageUrl,about,title,category,code,productstock,price;
  Product_Details({this.category,this.about,this.code,this.imageUrl,this.productstock,this.title ,this.price});
  @override
  _Product_DetailsState createState() => _Product_DetailsState();
}


class _Product_DetailsState extends State<Product_Details> {
  int _volume = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: height,
              width: width/1.3,
              child: Column(
                children: [
                  Container(
                    height: height/8,
                    width: width/1.4,
                    child: Center(child: RichText(text: TextSpan(
                      text: widget.title,style: TextStyle(color: Colors.black,fontSize: 20),
                    ) ),),
                  ),
                  Container( child:
                      Image.network(widget.imageUrl),
                  ),
                  Container(
                    child:Row(
                      children: [
                        SizedBox(
                          height: height / 10,
                        ),
                        IconButton(
                          icon: Icon(Icons.minimize,color: Colors.greenAccent),
                          tooltip: '-',color: Colors.black,
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
                        Text('  $_volume'),
                        IconButton(
                          icon: Icon(Icons.add,color: Colors.greenAccent,),
                          onPressed: () {
                            setState(() {
                              if(_volume == widget.productstock)
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
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black12),
                            ),
                            height: 30,
                            minWidth: 40,
                            color: Colors.red,
                            onPressed: ()=> AlertDialog(
                              title: Text("item added to Cart"),
                            ), child: Text("+ Add to Cart", style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
                      children: [
                        RichText(text: TextSpan(
                          text: "Sold : ",style: TextStyle(color: Colors.black45),
                        ) ),
                        RichText(text: TextSpan(
                          text:"150",style: TextStyle(color: Colors.black),
                        ) ),
                        SizedBox(
                          width: width/3.822,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(text: TextSpan(
                              text: "Available : ",style: TextStyle(color: Colors.black45),
                            ) ),
                            RichText(text: TextSpan(
                              text:"${widget.productstock}",style: TextStyle(color: Colors.black),
                            ) ),
                          ],
                        ),
                        Container(
                          child:RichText(text: TextSpan(
                            text: "hello",
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
                      children: [
                        RichText(text: TextSpan(
                          text: "price : ",style: TextStyle(color: Colors.black45),
                        ) ),
                        RichText(text: TextSpan(
                          text:"${widget.price} Rs /per unit",style: TextStyle(color: Colors.black),
                        ) ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
                      children: [
                        RichText(text: TextSpan(
                          text: "Category : ",style: TextStyle(color: Colors.black45),
                        ) ),
                        RichText(text: TextSpan(
                          text:"${widget.category}",style: TextStyle(color: Colors.black),
                        ) ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
                      children: [
                        RichText(text: TextSpan(
                          text: "About : ",style: TextStyle(color: Colors.black45),
                        ) ),
                        RichText(text: TextSpan(
                          text:"${widget.about}",style: TextStyle(color: Colors.black),
                        ) ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8 , top: 8),
                    child: Row(
                      children: [
                        RichText(text: TextSpan(
                          text: "Product Code : ",style: TextStyle(color: Colors.black45),
                        ) ),
                        RichText(text: TextSpan(
                          text:"${widget.code}",style: TextStyle(color: Colors.black),
                        ) ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8 , top: 8),
                    child: Row(
                      children: [
                        RichText(text: TextSpan(
                          text: "Total price : ",style: TextStyle(color: Colors.black45),
                        ) ),
                        RichText(text: TextSpan(
                          text:"${widget.price*_volume}",style: TextStyle(color: Colors.black),
                        ) ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
