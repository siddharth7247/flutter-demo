import 'package:flutter/material.dart';
import 'package:flutter_demo/streams/stream_builder_demo.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({super.key});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {

  final TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            stream: controller.stream,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index] ?? ''),
                      leading: IconButton(
                          onPressed: () {
                            data.remove(data[index]);
                            controller.add(data);
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
