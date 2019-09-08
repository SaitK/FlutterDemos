import 'package:flutter/material.dart';
import 'package:thekuafor/widgets/kuaforServicesList.dart';

class KuaforList extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Kuafor",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: _buildKuaforListPage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.black54,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  _buildKuaforListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildUnknownWidget(screenSize);
          } else if (index == 9) {
            return SizedBox(height: 12.0,);
          } else {
            return _buildKuaforServicesList();
          }
        },
      ),
    );
  }

  _buildUnknownWidget(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildUnknownButton("Unknown"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildUnknownButton("Unknown2"),
            ],
          ),
        ),
      ),
    );
  }

  _buildUnknownButton(String title) {
    return InkWell(
      onTap: (){
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }

  _buildKuaforServicesList() {
    return KuaforServicesList(
        user: "The First Kuafor",
        name: "Saç Kesimi",
        explanation: "Gelin Saçı",
        currentPrice: 100,
        imageUrl:
            "https://dugun-telasi.com/wp-content/uploads/2019/05/D%C3%BC%C4%9F%C3%BCn-Sa%C3%A7-Modeli-1.jpg");
  }
}
