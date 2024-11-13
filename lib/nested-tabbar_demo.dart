import 'package:flutter/material.dart';

class NestedTabbarDemo extends StatefulWidget {
  const NestedTabbarDemo({super.key});

  @override
  State<NestedTabbarDemo> createState() => _NestedTabbarDemoState();
}

class _NestedTabbarDemoState extends State<NestedTabbarDemo>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            TabBar.secondary(
                dividerColor: Colors.transparent,
                controller: tabController,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.deepOrange,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepOrange),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.deepOrange, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Recived"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.deepOrange, width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Given"),
                      ),
                    ),
                  ),
                ]),
            Container(
              margin: EdgeInsets.all(10),
              height: 90,
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                         decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange
                         ),
                         child: const Padding(padding: EdgeInsets.all(2),child: CircleAvatar(backgroundImage: AssetImage('assets/images/user.png'),),),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          Text('Given to Jack Mark',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Thnaks for guidence for Achive target',style: TextStyle(fontWeight: FontWeight.normal))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
