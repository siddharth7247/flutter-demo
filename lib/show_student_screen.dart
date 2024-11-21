import 'package:flutter/material.dart';
import 'package:flutter_demo/add_student_screen.dart';

class ShowStudentScreen extends StatefulWidget {
  const ShowStudentScreen({super.key});

  @override
  State<ShowStudentScreen> createState() => _ShowStudentScreenState();
} 

  class _ShowStudentScreenState extends State<ShowStudentScreen> {
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Students List'),
        ),
        body: ListView.builder(
          itemCount: stduentlist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text((index + 1).toString()),),
                title: Text(stduentlist[index].name.toString()),
                subtitle: Text(stduentlist[index].email.toString()),
                trailing: IconButton(onPressed: (){
                  setState(() {
                    stduentlist.remove(stduentlist[index]);
                  });
                }, icon: const Icon(Icons.delete)),
              ),
            );
          },
          ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddStudentScreen(),));
        },child: const Icon(Icons.add),),
      );
  }
}