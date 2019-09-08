import 'package:etrade/screens/productlist.dart';
import 'package:flutter/material.dart';
import 'package:etrade/models/product.dart';
import 'package:etrade/db/dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Product> products = new List<Product>();
    DbHelper dbHelper =new DbHelper();
    dbHelper.initializeDb().then((result)=>dbHelper.getProducts().then((result)=>products =result));

    Product product = new Product("Saç Kesimi", "Asker Traşı:)", 30);
    dbHelper.insert(product);
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'The Kuaför'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ProductList(),
    );
  }
}
