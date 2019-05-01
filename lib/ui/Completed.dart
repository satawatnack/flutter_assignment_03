import 'package:flutter/material.dart';

class Completed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CompletedState();
  }
}

class CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    if (true) {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Todo"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {},
              ),
            ],
          ),
          body: Center(
            child: new Text(
              "No data found..",
              textAlign: TextAlign.center,
            ),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Todo"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {},
              ),
            ],
          ),
          body: Text('data'));
    }
  }
}
