import 'package:flutter/material.dart';
import './email.dart' as email;
import './music.dart' as music;
import './shopping.dart' as shopping;
import './telepon.dart' as telepon;

void main() => runApp(new MaterialApp(
  title: "Tab Bar",
  home: new Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //buat controller
  TabController controller;

  @override
  void initState(){
    controller = new TabController(vsync: this,length: 4);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create AppBar
      appBar: new AppBar(
        //background colour
        backgroundColor: Colors.greenAccent,
        //title
        title: new Text("Dekat"),
        //bottom
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(text: "Email",),
            new Tab(text: "Music",),
            new Tab(text: "Shop",),
            new Tab(text: "Phone",),
          ],
        ),
      ),

      body: new TabBarView(
        //controller untuk TabBar
        controller: controller,
        children: <Widget>[
          //panggil halaman sesuai tab yang dibuat
          new email.Email(),
          new music.Music(),
          new shopping.Shopping(),
          new telepon.Telepon()
        ],
      ),
    );
  }
}


