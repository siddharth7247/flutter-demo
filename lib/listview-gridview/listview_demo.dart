import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) => SizedBox(
              height: 90,
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                         decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                         ),
                         child: const Padding(padding: EdgeInsets.all(2),child: CircleAvatar(backgroundImage: AssetImage('assets/images/user.png'),),),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          Text('Tony Stark',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Stark@gmail.com',style: TextStyle(fontWeight: FontWeight.normal))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ), separatorBuilder: (BuildContext context, int index) { 
              return const Divider(color: Colors.black);
           },
        ),
      );
    }
  }