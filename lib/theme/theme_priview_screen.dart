import 'package:flutter/material.dart';

class ThemePriviewScreen extends StatelessWidget {
   final ThemeData themeData;
   final VoidCallback onTap;
   final VoidCallback onSave;
  const ThemePriviewScreen({super.key, required this.themeData, required this.onTap, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Priview'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: onSave, child: const Text('Save')),
              OutlinedButton(onPressed: onTap, child: const Text('Apply')),
              OutlinedButton(onPressed: () {Navigator.of(context)..pop()..pop();}, child: const Text('Cacel'))
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
