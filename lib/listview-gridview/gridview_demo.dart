import 'package:flutter/material.dart';

class GridviewDemo extends StatelessWidget {
  const GridviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
            ), 
          itemCount: 64,
          itemBuilder: (context,index){
            int row = index ~/ 8;
            return Container(
              height: 20,
              width: 20,
              color: (row % 2 == 0) ? 
              index % 2 == 0 ? Colors.amber : Colors.black 
              : (row % 2 != 0) ? 
              index % 2 == 0 ? Colors.black : Colors.amber : Colors.black,
              child: Center(child: Text("$row $index ")),
            );
          }),
      )
    );
  }
}