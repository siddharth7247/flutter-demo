import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_theme_bottomsheet.dart';
import 'package:flutter_demo/cutom-widget_demo.dart';
import 'package:flutter_demo/home_screen.dart';
import 'package:flutter_demo/listview_demo.dart';
import 'package:flutter_demo/stream_builder_demo.dart';
import 'package:flutter_demo/tabbar_demo.dart';
import 'package:flutter_demo/theme_demo.dart';
import 'package:flutter_demo/widgets_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomThemeData>(
        stream: customThemeData.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: (snapshot.data?.isLightTheme ?? false)
                    ? Brightness.dark
                    : Brightness.light,
                primaryColor: snapshot.data?.primaryColor ?? Colors.deepPurple,
                colorScheme:  ColorScheme.light(
                  primary: snapshot.data?.primaryColor??Colors.deepPurple,
                  secondary: Colors.cyan
                ),
                textTheme: const TextTheme(
                    displayLarge:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    titleLarge:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
                    bodyMedium:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                appBarTheme: AppBarTheme(
                    backgroundColor:
                        snapshot.data?.appbarColor ?? Colors.deepPurple,
                    centerTitle:
                        (snapshot.data?.isCenterTitle ?? false) ? true : false,
                    titleTextStyle: TextStyle(
                        color: snapshot.data?.textColor ?? Colors.white,
                        fontSize: 25))),
            themeMode: ThemeMode.system,
            initialRoute: '/',
            routes: {
              '/': (context) => const Homescreen(),
              '/widgetsDemoScreen': (context) => const Widgetsdemo(),
              '/tabBarDemoScree': (context) => const TabbarDemo(),
              '/customWidgetDemoScreen': (context) => const CustomWidgetDemo(),
              '/listviewDemoScreen': (context) => const ListViewDemo(),
              '/streamBuilderDemoScreen': (context) => const StreamBuilderDemo(),
              '/themeDemoScreen': (context) => const ThemeDemo(),
            },
          );
        });
  }
}
