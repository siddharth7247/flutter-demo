import 'package:flutter/material.dart';

class ListviewCustomDemo extends StatelessWidget {
  const ListviewCustomDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(childrenDelegate:  SliverChildBuilderDelegate((BuildContext context,int index){
        return const ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage('assets/images/user.png'),)
        );
      }) ),
    );
  }
}