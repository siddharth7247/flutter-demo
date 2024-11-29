import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/api/details_screen.dart';
import 'package:http/http.dart' as http;

class ApiDemoScreen extends StatefulWidget {
  const ApiDemoScreen({super.key});

  @override
  State<ApiDemoScreen> createState() => _APiDemoScreenState();
}

class _APiDemoScreenState extends State<ApiDemoScreen> with SingleTickerProviderStateMixin{
  List<dynamic> users = [];
  late AnimationController _controller;
  late Animation<Offset> listSlideAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    listSlideAnimation = Tween<Offset>(begin: const Offset(-1, 0),end : Offset.zero).animate(_controller);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Api demo"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: listSlideAnimation,
            child: Card(
              child: ListTile(
                leading: GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => DetailsScreen(imgUrl: users[index]['picture']['medium']),));
                }, child: Hero(tag: users[index]['picture']['medium'], child: CircleAvatar(backgroundImage: NetworkImage(users[index]['picture']['medium']),))),
                title: Text(users[index]['name']['first']),
                subtitle: Text(users[index]['email']),
                trailing: (users[index]['gender'] == 'male') ? const Icon(Icons.male) : const Icon(Icons.female),
              ),
            ),
          );
        },),
      floatingActionButton: FloatingActionButton(onPressed: featchUsers),
    );
  }
  void featchUsers()async{
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    _controller.forward();
  }
}