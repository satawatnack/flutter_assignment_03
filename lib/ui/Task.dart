import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TaskState();
  }
}

class TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    if (true) {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Todo"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/new_Subject');
                },
              )
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
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/new_Subject');
                },
              )
            ],
          ),
          body: Text('fwwef'));
    }
  }
}
