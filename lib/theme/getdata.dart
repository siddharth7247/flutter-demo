import 'package:flutter/material.dart';

class Getdata extends StatefulWidget {
  const Getdata({super.key, required this.name});
  final String name;

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  @override
  void setState(VoidCallback fn) {

    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.name),
      ),
    );
  }
}