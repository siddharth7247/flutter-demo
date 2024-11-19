import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/streams/edit_notes_screen.dart';


 BehaviorSubject<List<String>> controller = BehaviorSubject<List<String>>();
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
                  return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(data[index]),
                      ),
                    );
                  },
              );  
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
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
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 0),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNotesScreen(),));
          },
          child:const Icon(Icons.edit),),
      ),
    );
  }
}
