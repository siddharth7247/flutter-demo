import 'package:flutter/material.dart';

class GridviewDemo extends StatelessWidget {
  const GridviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    int row = 8;
    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: row,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
            ), 
          itemCount: 64,
          itemBuilder: (context,index){
            int row = index ~/ 8;
            int column = index % 8 ;
            return Container(
              height: 20,
              width: 20,
              //color: (row+column) % 2 == 0 ? Colors.amber: Colors.white,
              // color: row % 2 == 0 ? index % 2 == 0 ? Colors.amber : Colors.white : Colors.amber,
              //color: (row % 2 == 0) ? index % 2 == 0 ? Colors.amber : Colors.white : (row % 2 != 0) ?
              child: Center(child: Text("$row $column $index ")),
            );
          }),
      )
    );
  }
}