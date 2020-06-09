import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Rest>> _getData() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/posts");

    var jsonData = json.decode(data.body);

    List<Rest> rests = [];
    for (var u in jsonData) {
      Rest rest = Rest(u["userId"], u["id"], u["title"], u["body"]);

      rests.add(rest);
    }

    print(rests.length);
    return rests;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RestAPI"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.doginni.cz/front_path/images/dog_circle.png"),
                    ),
                    title: Text(snapshot.data[index].id.toString()),
                    subtitle: Text(snapshot.data[index].title),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Rest {
  final int userId;
  final int id;
  final String title;
  final String body;

  Rest(this.userId, this.id, this.title, this.body);
}

class DetailPage extends StatelessWidget {
  final Rest rest;

  DetailPage(this.rest);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rest.id.toString()),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Card(
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(40.0, 40.0)),

              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        rest.body,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
