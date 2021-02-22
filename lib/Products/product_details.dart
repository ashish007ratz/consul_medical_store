import 'package:flutter/material.dart';
class Product_Details extends StatefulWidget {
  final imageUrl,about,title,category,code,productstock,price;
  Product_Details({this.category,this.about,this.code,this.imageUrl,this.productstock,this.title ,this.price});
  @override
  _Product_DetailsState createState() => _Product_DetailsState();
}


class _Product_DetailsState extends State<Product_Details> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              text:"100",style: TextStyle(color: Colors.black),
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
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
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

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
