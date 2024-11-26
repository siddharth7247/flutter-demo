import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/userdata.dart';

class DioDemoScreen extends StatefulWidget {
  const DioDemoScreen({super.key});

  @override
  State<DioDemoScreen> createState() => _DioDemoScreenState();
}

class _DioDemoScreenState extends State<DioDemoScreen> {
  List<UserData> userDataList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http-Dio',style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder(
        future: featchData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return const Center(
              child:  Text("Somthing went Wrong"),
            );
          }
          if(snapshot.data!.isEmpty){
              return const Center(
                child: Text("No Data Found"),
              );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Card(
               child: ListTile(
                leading: CircleAvatar(child: Text(snapshot.data![index].id.toString()),),
                title: Text(snapshot.data![index].title),
                subtitle: Text(snapshot.data![index].body,maxLines: 3,overflow: TextOverflow.ellipsis,),
               ),
              );
            },
          );
        },
      ),
    );
  }
  
  Future<List<UserData>> featchData() async {
    final dio = Dio();
    const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
    final userResponce = await dio.get(baseUrl);
    List<dynamic> userData = userResponce.data;
    userDataList = userData.map((users) => UserData.fromJson(users)).toList();
    log("UserData List Length : ${userDataList.length}");
    return userDataList;
  }
}
