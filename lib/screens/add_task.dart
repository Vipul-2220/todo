import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final maxLines = 8;
  // String state = 'Data added';

  addTaskToFirebase() async {
    var time = DateTime.now();
    try {
      await FirebaseFirestore.instance
          .collection('task')
          .doc()
          .collection('mytasks')
          .doc(time.toString())
          .set(
        {
          'title': titleController.text,
          'description': descriptionController.text,
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
      appBar: AppBar(
        title: const Text(
          'New Task',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    labelText: 'Enter Title', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              // height: maxLines * 24.0,
              child: TextField(
                controller: descriptionController,
                maxLines: maxLines,
                decoration: const InputDecoration(
                    // fillColor: Colors.white,
                    // filled: true,
                    labelText: 'Enter Description',
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  // style: ButtonStyle(backgroundColor:
                  //     MaterialStateProperty.resolveWith<Color>(
                  //         (Set<MaterialState> states) {
                  //   if (states.contains(MaterialState.pressed))
                  //     return Colors.purple.shade100;
                  //   return Theme.of(context).primaryColor;
                  // })),
                  child: Text(
                    'Add Task',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onPressed: () {
                    addTaskToFirebase();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
