import 'package:flutter/material.dart';
import 'package:flutter_demo/nested-tabbar_demo.dart';

class TabbarDemo extends StatefulWidget {
  const TabbarDemo({super.key});

  @override
  State<TabbarDemo> createState() => _TabbarDemoState();
}

class _TabbarDemoState extends State<TabbarDemo> {
  int selectedIndex = 0;

  void onNavBarItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                text: 'Bus-Meeting',
              ),
              Tab(
                text: 'Connects',
              ),
              Tab(
                text: 'Bus-Recived',
              ),
              Tab(
                text: 'Testimonials',
              )
          ]),
        ),
        body: const TabBarView(children: [
          NestedTabbarDemo(),
          NestedTabbarDemo(),
          NestedTabbarDemo(),
          NestedTabbarDemo()
        ]),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  topLeft: Radius.circular(100))),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  label: 'Notification'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting')
            ],
            currentIndex: selectedIndex,
            onTap: onNavBarItemTap,
            selectedItemColor: Colors.blue,
            selectedIconTheme: const IconThemeData(),
            unselectedItemColor: Colors.black,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
