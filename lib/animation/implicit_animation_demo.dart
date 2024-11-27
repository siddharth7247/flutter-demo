import 'package:flutter/material.dart';

class ImplicitAnimationDemo extends StatefulWidget {
  const ImplicitAnimationDemo({super.key});

  @override
  State<ImplicitAnimationDemo> createState() => _ExplicitAnimationDemoState();
}

class _ExplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  bool isExpanded = false;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                isExpanded = !isExpanded;
              }),
              child: AnimatedContainer(
                height: isExpanded ? 200 : 100,
                width: isExpanded ? 200 : 100,
                decoration: BoxDecoration(
                  color: isExpanded ? Colors.deepPurple : Colors.amberAccent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                duration: const Duration(seconds: 3),
                curve: Curves.bounceOut,
                child: const Center(child: Text("Tap Here")),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              height: 50,
              width: isAdded ? 100 : 50,
              decoration: BoxDecoration(
                color: isAdded ? Colors.green : Colors.amberAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              duration: const Duration(milliseconds: 500),
              child: IconButton(
                  onPressed: () => setState(() {
                        isAdded = !isAdded;
                      }),
                  icon: isAdded
                      ? const Icon(Icons.check)
                      : const Icon(Icons.shopping_cart)),
            ),
            const SizedBox(
              height: 10,
            ),
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 10000),
              tween: Tween<double>(begin: 0, end: 300),
              curve: Curves.bounceOut,
              builder: (context, size, widget) {
                return Container(
                  width: size,
                  height: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
