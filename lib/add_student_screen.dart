import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:flutter_demo/models/studentModel.dart';

List<Student> stduentlist = List.empty(growable: true);

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text('Enter Student Details',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              CustomTextfield(controller: nameController, hintText: 'Enter first Name', icon: Icons.person, validator: 'name'),
              CustomTextfield(controller: surnameController, hintText: 'Enter Surname', icon: Icons.person_2_outlined),
              CustomTextfield(controller: emailController, hintText: 'Enter Email', icon: Icons.email,validator: 'email',),
              CustomTextfield(controller: passwordController, hintText: 'Enter Password', icon: Icons.password),
              const SizedBox(height: 10,)
,              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.deepPurple.shade500,
                  minimumSize: const Size(double.infinity, 50)
                ),
                onPressed: (){
                Student s1 = Student(name: nameController.text.toString(),surname: surnameController.text.toString(),email: emailController.text.toString(),password: passwordController.text.toString());
               
                String jsonStudent = jsonEncode(s1);
                Map<String,dynamic> jsonMap = jsonDecode(jsonStudent);
          
                log("Student data jsonencode : $jsonStudent");
                log("Student data jsondecode : $jsonMap");
               
                stduentlist.add(Student.fromJson(jsonMap));
                Navigator.pushNamed(context, '/showStudentScreen');
              }, child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}