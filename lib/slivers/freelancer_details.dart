import 'package:flutter/material.dart';

class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              expandedHeight: 300,
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text(
                'Freelancer',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              flexibleSpace:
                  FlexibleSpaceBar(background: ExpandenAppbarContent()),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SliverPersistentHeader(
            pinned: true,
            delegate: _MySliverPersistentHeaderDelegate(),
          ),

            const SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      color: Colors.black,
                      child: ListTile(
                        title: Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Slivers Widgetsdemo",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      color: Colors.black,
                      child: ListTile(
                        title: Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Slivers Widgetsdemo",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(20)),
                  child: const Text(
                    'Hire',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
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
          left: 170,
          right: 50,
          top: 45,
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        Positioned(
          left: 50,
          right: 50,
          top: 80,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.amber, shape: BoxShape.circle),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
        ),
        const Positioned(
          left: 145,
          right: 50,
          top: 190,
          child: Text(
            'Freelancer',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        const Positioned(
          left: 170,
          right: 50,
          top: 220,
          child: Text(
            'AED 30/hr',
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Card(
                  color: Colors.black,
                  child: ListTile(
                    title: Text(
                      "0",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Overall Jobs",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Card(
                  color: Colors.black,
                  child: ListTile(
                    title: Text(
                      "0",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Overall Jobs",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
