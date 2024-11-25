import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/getdata.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.yellow,
      body: Padding(
        padding:const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              const Text("Build Awesome Apps",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const Text("Lets put your creativity on the development highway",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const Getdata(name: "Siddharth"),));
                  }, child: const Text("LOGIN"),),
                  const SizedBox(width: 100,),
                  ElevatedButton(onPressed: (){}, child: const Text("SIGNUP"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}