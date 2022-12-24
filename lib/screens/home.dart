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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'TO DO App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: 300,
                      child: TextField(
                        controller: taskController,
                        // maxLines: maxLines,
                        decoration: const InputDecoration(
                            labelText: 'Type Something here...',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
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
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ReadTask(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTask(),
            ),
          );
        },
      ),
    );
  }
}
