import 'package:flutter/material.dart';

class KuaforDetail extends StatefulWidget {
  @override
  _KuaforDetailState createState() => _KuaforDetailState();
}

class _KuaforDetailState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Kuafor Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildKuaforDetails(context),
    );
  }

  _buildKuaforDetails(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildKuaforImages(),
              _buildKuaforTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildServicesPrice(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(screenSize),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(screenSize),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        )
      ],
    );
  }

  _buildKuaforImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.network(
                        "https://dugun-telasi.com/wp-content/uploads/2019/05/Abiye-Sa%C3%A7-Modeli-1.jpg"),
                    Image.network(
                        "https://dugun-telasi.com/wp-content/uploads/2019/05/Abiye-Sac-Modeli.jpg"),
                    Image.network(
                        "https://dugun-telasi.com/wp-content/uploads/2019/05/12.%C3%96rg%C3%BCl%C3%BC-Abiye-Sa%C3%A7-Modeli.jpg")
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.999),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildKuaforTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          "Modellerimiz",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildServicesPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "\$ 100",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          )
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.expand_more),
          SizedBox(width: 12.0,),
          Text("Daha fazla bilgi için tıklayınız.",style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}
