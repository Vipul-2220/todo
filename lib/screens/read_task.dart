import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/utils/constants.dart';

class ReadTask extends StatefulWidget {
  const ReadTask({super.key});

  @override
  State<ReadTask> createState() => _ReadTaskState();
}

class _ReadTaskState extends State<ReadTask> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('task')
          .doc(Constants.dummyUserId)
          .collection('mytasks')
          .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        // var data = snapshot.data!;
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              print('Doc: $document');
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              // document.reference.collection('mytasks').get();
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                child: Row(
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.done))),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Text : ${data['title']}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],

                  // subtitle: Text(data['company']),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
