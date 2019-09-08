import 'package:flutter/material.dart';
import 'package:forms_demo/mixins/validation_mixin.dart';
import 'package:forms_demo/models/customer.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final customer = Customer();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            firstNameField(),
            lastNameField(),
            emailNameField(),
            passwordNameField(),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget firstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Adınız", hintText: "Engin"),
      validator: validateFirstName,
      onSaved: (String value){
        customer.firstName = value;
      },
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soyadınız", hintText: "Demiroğ"),
      validator: validateLastName,
    );
  }

  Widget emailNameField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: "Email", hintText: "mail@mail.com"),
      validator: validateEmail,
    );
  }

  Widget passwordNameField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Şifreniz", hintText: "şifre"),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()){
          formKey.currentState.save();
          saveCustomer(customer);
        }
      },
    );
  }

  void saveCustomer(Customer customer) {
    print(customer.firstName);
  }
}
