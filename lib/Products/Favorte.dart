import 'package:consule_medical_store/Home/Home.dart';
import 'package:flutter/material.dart';
class Favorte_items extends StatefulWidget {
  @override
  _Favorte_itemsState createState() => _Favorte_itemsState();
}

class _Favorte_itemsState extends State<Favorte_items> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Container(
              height: height/2,
                width: width/1.2,
                child: Product1()),
          )
        ],
      ),
    );
  }
}
