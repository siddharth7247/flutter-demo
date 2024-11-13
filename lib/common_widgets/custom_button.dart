import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(title,style: const TextStyle(fontSize: 20),),
      ),
    );
  }
}