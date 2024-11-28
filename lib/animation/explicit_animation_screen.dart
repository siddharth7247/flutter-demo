import 'package:flutter/material.dart';

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ExplicitAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    slideAnimation = Tween<Offset>(begin: const Offset(0, -5), end: Offset.zero)
        .animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: scaleAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          controller.reverse();
                        },
                      );
                    },
                    child: const Text('Reverse')),
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          controller.repeat();
                        },
                      );
                    },
                    child: const Text("Repeat")),
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          controller.stop();
                        },
                      );
                    },
                    child: const Text('stop')),
                ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          controller.forward();
                        },
                      );
                    },
                    child: const Text("Resume"))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
