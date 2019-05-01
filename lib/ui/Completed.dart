import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Completed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CompletedState();
  }
}

class CompletedState extends State<Completed> {
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
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      _store
                          .collection('list')
                          .where('done', isEqualTo: true)
                          .getDocuments()
                          .then((value) {
                        value.documents.forEach((f) {
                          f.reference.delete();
                        });
                      });
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(
                        snapshot.data.documents.elementAt(index).data['title']),
                    value:
                        snapshot.data.documents.elementAt(index).data['done'] ==
                            1,
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
                        'done': 0
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
        }
      },
      stream: _store.collection('list').where('done', isEqualTo: 1).snapshots(),
    );
  }
}
