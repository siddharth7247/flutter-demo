import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class SlidebarBottomnavigationScreen extends StatefulWidget {
  const SlidebarBottomnavigationScreen({super.key});

  @override
  State<SlidebarBottomnavigationScreen> createState() =>
      _SlidebarBottomnavigationScreenState();
}

class _SlidebarBottomnavigationScreenState
    extends State<SlidebarBottomnavigationScreen> {
  late List<CollapsibleItem> items;
  int selectedIndex = 0;

  List<CollapsibleItem> get generateItems {
    return [
      CollapsibleItem(
        text: 'Profile',
        icon: Icons.person,
        onPressed: () {},
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Edit',
        icon: Icons.edit,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Delete',
        icon: Icons.delete,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () {},
      ),
    ];
  }

  @override
  void initState() {
    items = generateItems;
    super.initState();
  }

  void onNavBarItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collapsing slidebar"),
      ),
      body: size.width < 600
          ? null
          : CollapsibleSidebar(
              items: items,
              body: _body(size, context),
              isCollapsed: false,
              title: 'siddharth',
            ),
      bottomNavigationBar: size.width >= 600
          ? null
          : Container(
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
                selectedItemColor: Colors.blue,
                onTap: onNavBarItemTap,
                selectedIconTheme: const IconThemeData(),
                unselectedItemColor: Colors.black,
              ),
            ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50]);
  }
}
