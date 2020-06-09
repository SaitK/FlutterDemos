import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String text = "a";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView.builder(
          itemCount: 15,
          itemExtent: 150.0,
          itemBuilder: (context,index){
            return Card(
      color: Colors.black12,
      elevation: 10.0,
      
      child: Column(
        children: <Widget>[
          CircleAvatar(
            child: Text("SK"),
          ),
          Placeholder()
        ],
      ),
            );
          },
        ),

    );
  }
}