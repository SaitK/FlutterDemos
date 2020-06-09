import 'package:flutter/material.dart';
import 'package:ots/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  /*StudentAdd(List<Student> students){
    this.students = students;
  }*/

  StudentAdd(this.students);

  @override
  _StudentAddState createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();

  var student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              _buildFirstNameField(),
              _buildLastNameField(),
              _buildGradeField(),
              _buildSubmitButton(),
              ],
          ),
        ),
      ),
    );
  }

  _buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci Adı: ",
        hintText: "S",
        
      ),
      onSaved: (String value){
        student.firstName = value;
      },
    );
  }

  _buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci Soyadı: ",
        hintText: "K",
        
      ),
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }

  _buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Aldığı Not: ",
        
        
      ),
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }

  _buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}
