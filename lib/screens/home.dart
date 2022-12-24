import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/screens/add_task.dart';
import 'package:todo/screens/read_task.dart';
import 'package:todo/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController taskController = TextEditingController();

  addTaskToFirebase() async {
    var time = DateTime.now();
    try {
      await FirebaseFirestore.instance
          .collection('task')
          .doc(Constants.dummyUserId)
          .collection('mytasks')
          .add(
        {
          'title': taskController.text,
          'timestamp': time.millisecondsSinceEpoch,
        },
      );
    } catch (e) {
      print(e.toString());
    }

    Fluttertoast.showToast(msg: 'Data Added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[400],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'TO DO App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        // width: 300,
                        child: TextField(
                          controller: taskController,
                          // maxLines: maxLines,

                          decoration: InputDecoration(
                            hintText: 'Type Something here....',
                            // labelText: 'Type Something here...',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(width: 5)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: () {
                                  addTaskToFirebase();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Divider(
                              thickness: 2.0,
                              height: 5,
                              color: Colors.grey[800],
                              endIndent: 2,
                              indent: 2,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: ReadTask(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
