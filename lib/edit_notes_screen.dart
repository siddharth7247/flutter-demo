import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_demo/stream_builder_demo.dart';

class EditNotesScreen extends StatefulWidget {
   const EditNotesScreen({super.key});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  @override
void initState() {
    SchedulerBinding.instance.addPostFrameCallback((duretion) => controller.sink.add(data));
    super.initState();
  }
  final TextEditingController noteController = TextEditingController();

    StreamSubscription<List<String>>  subscription = controller.stream.listen((deta){print("date on listner : $deta");});
    Stream<List<String>> get noteStream => controller.stream;
  @override
  Widget build(BuildContext context) {

      Stream s1  = controller.stream;
     return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Notes'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: StreamBuilder(
                stream: noteStream,
                builder: (context, snapshot) { 
                  print("Stream : ${s1.length}");
                  print("Controlerr lenght : ${controller.stream.length.toString()}");
                  print("Snapshot length : ${snapshot.data?.length}");
                  return ListView.builder(
                  itemCount: snapshot.data?.length??0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data?[index]??''),
                        leading: IconButton(onPressed: (){
                          data.remove(data[index]);
                          setState(() {

                          });
                        }, icon: const Icon(Icons.delete)),
                      ),
                    );
                  },
                );
              },
            )
          ),
        ],
      ),
    );
  }
}