import 'package:flutter/material.dart';
import 'package:thekuafor/screens/kuaforList.dart';
import 'package:thekuafor/utilities/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Kuafor',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: KuaforList(),
      routes: Routes.routes,
    );
  }
}
