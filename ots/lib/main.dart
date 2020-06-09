import 'package:flutter/material.dart';
import 'package:ots/screens/student_add.dart';

import 'models/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OTS",
      home: Ots(),
    );
  }
}

class Ots extends StatefulWidget {
  @override
  _OtsState createState() => _OtsState();
}

class _OtsState extends State<Ots> {
  List<Student> students = [
    Student.withId(1, "S", "K", 75),
    Student.withId(2, "C", "K", 45),
    Student.withId(3, "M", "K", 35),
  ];

  Student selectedStudent = Student.withId(0, "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTS"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 20.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      radius: 18.0,
                      backgroundImage: NetworkImage(
                          "https://img.etimg.com/thumb/width-640,height-480,imgsize-594328,resizemode-1,msid-69381991/in-webs-dark-corner-your-profile-is-on-sale-for-just-a-few-bucks.jpg"),
                    ),
                  ),
                  title:
                      Text(students[i].firstName + ' ' + students[i].lastName),
                  subtitle: Text("Alınan Not: " +
                      students[i].grade.toString() +
                      "[" +
                      students[i].getStatus +
                      "]"),
                  trailing: buildStatusIcon(students[i].grade),
                  onTap: (){
                    setState(() {
                      this.selectedStudent = students[i];
                    });
                  },
                  onLongPress: (){
                    print("Uzun Tıklandı");
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni Öğrenci")
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Güncelle")
                  ],
                ),
                onPressed: (){},
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete_forever),
                    SizedBox(width: 5.0,),
                    Text("Sil")
                  ],
                ),
                onPressed: (){},
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade>=50){
      return Icon(Icons.done);
    }
    else if(grade>=40){
      return Icon(Icons.album);
    }
    else{
      return Icon(Icons.clear);
    }

  }
}
