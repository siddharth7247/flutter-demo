import 'package:flutter/material.dart';

class ThemePriviewScreen extends StatelessWidget {
   final ThemeData? themeData;
   final VoidCallback onTap;
  const ThemePriviewScreen({super.key, this.themeData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData!,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Priview'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: onTap, child: const Text('Save')),
              OutlinedButton(onPressed: () {}, child: const Text('Apply')),
              OutlinedButton(onPressed: () {}, child: const Text('Cacel'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
