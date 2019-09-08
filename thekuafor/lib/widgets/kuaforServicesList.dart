import 'package:flutter/material.dart';
import 'package:thekuafor/utilities/constants.dart';

class KuaforServicesList extends StatelessWidget {
  String user;
  String name;
  String explanation;
  int currentPrice;
  String imageUrl;
  String comment;
  KuaforServicesList({this.user, this.name,this.explanation, this.currentPrice, this.imageUrl, this.comment});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildKuaforServicesItemCard(context),
        _buildKuaforServicesItemCard(context)
      ],
    );
  }

  _buildKuaforServicesItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_KUAFOR_DETAIL);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0,),
            Container(
              child: Image.network(this.imageUrl),
              height: 250.0,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 3.0,),
                  Text(
                    this.user,
                    style: TextStyle(fontSize: 16.0,fontStyle: FontStyle.italic,color: Colors.blueAccent),
                  ),
                  SizedBox(width: 8.0,),
                  Text(
                    this.explanation,
                    style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 5.0,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
