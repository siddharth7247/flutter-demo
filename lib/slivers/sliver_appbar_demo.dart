import 'package:flutter/material.dart';

class SliverAppbarDemo extends StatelessWidget {
  const SliverAppbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           const SliverAppBar(
            snap: false,
            pinned: false,
            floating: false,
            expandedHeight: 250,
            
            flexibleSpace: Expanded(
              child: FlexibleSpaceBar(
                  title: Text('Sliver appbar demo'),
                  ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  tileColor:
                      (index % 2 == 0) ? Colors.amberAccent : Colors.deepPurple,
                  title: Text(index.toString()),
                );
              },
              childCount: 20
            ),
          ),
        ],
      ),
    );
  }
}
