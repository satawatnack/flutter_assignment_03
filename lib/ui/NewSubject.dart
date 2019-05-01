import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class NewSubject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewSubjectState();
  }
}

class NewSubjectState extends State<NewSubject> {
  Firestore _store = Firestore.instance;
  TextEditingController subject = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Subject"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            TextFormField(
              controller: subject,
              decoration: InputDecoration(
                  labelText: "Subject", hintText: "please input your subject"),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
              },
            ),
            RaisedButton(
              child: Text("Save"),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _store
                      .collection('list')
                      .add({'title': subject.text, 'done': 0});
                  Navigator.pushReplacementNamed(context, "/");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
