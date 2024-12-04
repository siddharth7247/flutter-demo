import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/slivers/freelancer_details.dart';

class SliverTaskDemo extends StatefulWidget {
  const SliverTaskDemo({super.key});

  @override
  State<SliverTaskDemo> createState() => _SliverTaskDemoState();
}

class _SliverTaskDemoState extends State<SliverTaskDemo> {
  late ScrollController _scrollController;
  static const expandedHeight = 300.0;
  Color _textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > expandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: _isAppBarExpanded
                ? const CupertinoSearchTextField(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.white24,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  )
                : null,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset('assets/images/india-flag-icon.png'),
            ),
            expandedHeight: expandedHeight,
            centerTitle: false,
            flexibleSpace:
                FlexibleSpaceBar(background: ExpandenAppbarContent()),
            backgroundColor: Colors.black,
            floating: false,
            pinned: true,
            snap: false,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white24),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white24),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'Services',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[200],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flag,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Content',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink[200],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.content_copy,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'project',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.computer,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'digital war',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange[200],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.party_mode_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'barista',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blue.shade200,
                child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Ready To Hire',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10)),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'Top InstaWorker',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Card(
                  color: Colors.black,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/bg.jpeg'),
                    ),
                    title: Text(
                      'Freelancers $index',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    trailing: const Text(
                      'ADE 30/hr',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FreelancerDetails(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(10),
        color: Colors.black,
        height: 70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shop,
                color: Colors.grey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'Post a Job',
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.email,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandenAppbarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/bg.jpeg",
          fit: BoxFit.cover,
        ),
        const Positioned(
          top: 250,
          left: 20,
          right: 20,
          child: SizedBox(
            height: 50,
            child: CupertinoSearchTextField(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.white24,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 30,
          right: 50,
          top: 170,
          child: Text(
            'Good Morning Employeers!!',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        const Positioned(
          left: 30,
          right: 50,
          top: 210,
          child: Text(
            'Do You Need Help ?',
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePageHeader extends SliverPersistentHeaderDelegate {
  ProfilePageHeader({
    required this.minExtent,
    required this.maxExtent,
  });
  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        shrinkOffset >= minExtent
            ? Container(
                color: Colors.black,
              )
            : Image.asset(
                'assets/images/bg.jpeg',
                fit: BoxFit.cover,
              ),
        Positioned(
          top: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                  height: 40,
                  child: Image.asset('assets/images/india-flag-icon.png')),
              const SizedBox(
                width: 20,
              ),
              Opacity(
                opacity: 0.0 + math.max(0.0, shrinkOffset) / maxExtent,
                child: const SizedBox(
                  height: 45,
                  width: 200,
                  child: CupertinoSearchTextField(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.white24,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white24),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white24),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 30,
          right: 50,
          top: 120,
          child: Text(
            'Good Morning Employeers!!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
            ),
          ),
        ),
        Positioned(
          left: 30,
          right: 50,
          top: 150,
          child: Text(
            'Do You Need Help ?',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
            ),
          ),
        ),
        const Positioned(
          left: 20,
          right: 20,
          top: 190,
          child: CupertinoSearchTextField(
            padding: EdgeInsets.all(15),
            backgroundColor: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    return 1.0 - math.max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;
}
