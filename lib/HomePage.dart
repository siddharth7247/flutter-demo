import 'package:demo_flutter/CupertinoDesignDemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const CupertinodesigScreen()));
            }, child: const Text("Cupertion Design Demo"))
          ],
        ),
      ),
    );
  }
}