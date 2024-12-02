import 'package:flutter/material.dart';

class MyCustomScrollView extends StatefulWidget {
  const MyCustomScrollView({super.key});

  @override
  _MyCustomScrollViewState createState() => _MyCustomScrollViewState();
}

class _MyCustomScrollViewState extends State<MyCustomScrollView> {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey();
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  void _addItem() {
    final index = _items.length;
    _items.add('Item ${index + 1}');
    _listKey.currentState?.insertItem(index);
  }

  void _removeItem() {
    if (_items.isEmpty) return;
    final index = _items.length - 1;
    final removedItem = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: ListTile(
          title: Text(removedItem),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomScrollView Example')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _addItem,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _removeItem,
            child:const Icon(Icons.remove),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // 1. SliverAppBar
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver App Bar'),
              background: Image.network(
                'https://via.placeholder.com/600x300',
                fit: BoxFit.cover,
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
            
          ),

          // 2. SliverAnimatedList
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return FadeTransition(
                opacity: animation,
                child: ListTile(
                  title: Text(_items[index]),
                ),
              );
            },
          ),

          // 3. SliverPrototypeExtentList
          SliverPrototypeExtentList(
            prototypeItem: const ListTile(title: Text('Prototype Item')),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Prototype Item $index'),
              ),
              childCount: 5,
            ),
          ),

          // 4. SliverFillViewport
          SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.purple[(index % 9 + 1) * 100],
                alignment: Alignment.center,
                child: Text(
                  'Viewport Item $index',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              childCount: 3,
            ),
          ),

          // 5. SliverToBoxAdapter
          const SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Text(
                'This is a regular widget wrapped in SliverToBoxAdapter.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          // 6. SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Sliver List Item $index'),
              ),
              childCount: 10,
            ),
          ),

          // 7. SliverFixedExtentList
          SliverFixedExtentList(
            itemExtent: 80.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.blue[(index % 9 + 1) * 100],
                alignment: Alignment.center,
                child: Text(
                  'Fixed Extent List Item $index',
                  style:const TextStyle(color: Colors.white),
                ),
              ),
              childCount: 10,
            ),
          ),

          // 8. SliverGrid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.red[(index % 9 + 1) * 100],
                child: Text('Grid Item $index'),
              ),
              childCount: 6,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),

          // 9. SliverPersistentHeader
          SliverPersistentHeader(
            pinned: true,
            delegate: _MySliverPersistentHeaderDelegate(),
          ),

          // 10. SliverFillRemaining
          SliverFillRemaining(
            child: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                'This fills the remaining space!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Persistent Header Delegate
class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child:const Text(
        'Sticky Header',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
