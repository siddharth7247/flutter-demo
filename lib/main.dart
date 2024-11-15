import 'package:flutter/material.dart';
import 'package:flutter_demo/cutom-widget_demo.dart';
import 'package:flutter_demo/home_screen.dart';
import 'package:flutter_demo/listview_demo.dart';
import 'package:flutter_demo/stream_builder_demo.dart';
import 'package:flutter_demo/tabbar_demo.dart';
import 'package:flutter_demo/widgets_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const Homescreen(),
        '/widgetsDemoScreen':(context) => const Widgetsdemo(),
        '/tabBarDemoScree':(context) => const TabbarDemo(),
        '/customWidgetDemoScreen':(context) => const CustomWidgetDemo(),
        '/listviewDemoScreen' : (context) => const ListViewDemo(),
        '/streamBuilderDemoScreen' : (context) => const StreamBuilderDemo()
      },
    );
  }
}
