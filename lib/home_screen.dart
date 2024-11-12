import 'package:flutter/material.dart';
import 'package:flutter_demo/authentication/splash_screen.dart';
import 'package:flutter_demo/tabbar_demo.dart';
import 'package:flutter_demo/widgets_demo.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => const Widgetsdemo()));
            }, child: const Text("Widgets demo")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => const SplashScreen()));
            }, child: const Text("Signup App")),
             ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => const TabbarDemo()));
            }, child: const Text("Tabbar demo"))
          ],
        ),
      ),
    );
  }
}