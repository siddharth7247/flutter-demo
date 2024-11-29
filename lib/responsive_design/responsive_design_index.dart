import 'package:flutter/material.dart';
import 'package:flutter_demo/responsive_design/adaptive_form_screen.dart';
import 'package:flutter_demo/responsive_design/custom_responsive_container.dart';
import 'package:flutter_demo/responsive_design/responsive_card.dart';
import 'package:flutter_demo/responsive_design/slidebar_bottomnavigation_screen.dart';

class ResponsiveDesignIndex extends StatelessWidget {
  const ResponsiveDesignIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomResponsiveContainer(),
                ),
              ),
              child: const Text("Responsive Container"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResponsiveCard(),
                ),
              ),
              child: const Text("Responsive cart"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SlidebarBottomnavigationScreen(),
                ),
              ),
              child: const Text("Responsive Slidebar"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdaptiveFormScreen(),
                ),
              ),
              child: const Text("Adaptive"),
            ),
          ],
        ),
      ),
    );
  }
}
