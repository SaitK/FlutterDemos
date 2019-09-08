import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CitySelectorWidget(),
    );
  }
}

class CitySelectorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CitySelectorState();
}

class CitySelectorState extends State<CitySelectorWidget> {
  var cities = ["İstanbul", "Ankara", "İzmir", "Van"];
  var selectedCity = "Ankara";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Selection App"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              items: cities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: selectedCity,
              onChanged: (String value) {
                setState(() {
                  this.selectedCity = value;
                });
              },
            ),
            Text("Şu an seçtiğiniz şehir : " + selectedCity),
          ],
        ),
      ),
    );
  }
}
