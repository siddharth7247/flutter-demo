import 'dart:async';

import 'package:flutter/material.dart';

 StreamController<List<String>> controller = StreamController.broadcast();

List<String> data  = [];

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({super.key});

  @override
  State<StreamBuilderDemo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StreamBuilderDemo> {
  
 

  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: StreamBuilder(
                stream: controller.stream,
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if(snapshot.hasData){
                  return ListView.builder(
                  itemCount: snapshot.data?.length??0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data?[index]??''),
                      ),
                    );
                  },);
             }else{
              return Text('No note founds');
             }
  
            },
          )),
          TextFormField(
            controller: noteController,
            decoration: InputDecoration(
                hintText: 'Enter note here',
                suffixIcon: GestureDetector(
                  child: const Icon(Icons.send),
                  onTap: () {
                    data.add(noteController.text);
                    controller.add(data);
                    noteController.clear();
                  },
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 3),
                )),
          ),
        ],
      ),
    );
  }
}
