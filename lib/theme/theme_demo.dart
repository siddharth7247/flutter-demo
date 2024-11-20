import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/custom_theme_bottomsheet.dart';

class ThemeDemo extends StatefulWidget {
  const ThemeDemo({super.key});

  @override
  State<ThemeDemo> createState() => _ThemeDemoState();
}
enum Themes{light,dark}

class _ThemeDemoState extends State<ThemeDemo> {

  Themes selectedTheme = Themes.light;
  double value = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (context) =>  const CustomThemeBottomsheet(),);
                },
                child: const Text('Change Theme'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),),
    );
  }
}
