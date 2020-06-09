import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Rest>> getData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");

    List data = json.decode(response.body);
    List<Rest> restApi = [];

    for (var u in data){
      Rest rest = Rest(u["userId"], u["id"], u["title"], u["body"]);
      restApi.add(rest);
    }
    print(restApi.length);

    return restApi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: getDataButton(),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("Rest API"),
      centerTitle: true,
    );
  }

  Widget getDataButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: myBoxDecoration(),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Get Data"),
            splashColor: Colors.orangeAccent,
            onPressed: () {},
          ),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return ListView.builder(
                  itemExtent: 12.0,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget bottomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.home, size: 28.0,),
        Icon(Icons.access_alarm, size: 28.0,),
        Icon(Icons.account_circle, size: 28.0,),
      ],
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.white70,
      border: Border.all(
      color: Colors.black,
    ));
  }
}

class Rest {
  final int userId;
  final int id;
  final String title;
  final String body;

  Rest(this.userId, this.id, this.title, this.body);
}
