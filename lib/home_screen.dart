import 'package:flutter/material.dart';
import 'package:flutter_demo/authentication/splash_screen.dart';
import 'package:flutter_demo/gridview_demo.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/widgetsDemoScreen');
              }, child: const Text("Widgets demo")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const SplashScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child){
                      var begin = const Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
                      return SlideTransition(position: animation.drive(tween),child: child,);
                    }
                    ));
              }, child: const Text("Signup App")),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/tabBarDemoScree');
              }, child: const Text("Tabbar,Botton Navigation demo")),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/customWidgetDemoScreen');
              }, child: const Text("Custom Widget,Form valiadtion demo")),
               ElevatedButton(onPressed: (){
               Navigator.pushNamed(context, '/listviewDemoScreen');
              }, child: const Text("ListView demo")),
               ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => const GridviewDemo()));
              }, child: const Text("Gridview Demo"))
            ],
          ),
        ),
      ),
    );
  }
}