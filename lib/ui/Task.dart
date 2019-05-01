import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskState();
  }
}

class TaskState extends State<Task> {
  Firestore _store = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data.documents.length > 0) {
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
              body: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(
                        snapshot.data.documents.elementAt(index).data['title']),
                    value:
                        snapshot.data.documents.elementAt(index).data['done'] !=
                            0,
                    onChanged: (bool value) {
                      _store
                          .collection('list')
                          .document(snapshot.data.documents
                              .elementAt(index)
                              .documentID)
                          .setData({
                        'title': snapshot.data.documents
                            .elementAt(index)
                            .data['title'],
                        'done': 1
                      });
                    },
                  );
                },
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
              body: Center(
                child: new Text(
                  "No data found..",
                  textAlign: TextAlign.center,
                ),
              ));
        }
      },
      stream: _store.collection('list').where('done', isEqualTo: 0).snapshots(),
    );
  }
}
