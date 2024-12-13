import 'package:flutter/material.dart';
import 'package:flutter_demo/authentication/splash_screen.dart';
import 'package:flutter_demo/listview-gridview/gridview_demo.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/widgetsDemoScreen');
                    },
                    child: const Text("Widgets demo")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SplashScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = const Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              }));
                    },
                    child: const Text("Signup App")),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tabBarDemoScree');
                  },
                  child: const Text("Tabbar,Botton Navigation demo"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/customWidgetDemoScreen');
                  },
                  child: const Text("Custom Widget,Form valiadtion demo"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/listviewDemoScreen');
                  },
                  child: const Text("ListView demo"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GridviewDemo(),
                        ),
                      );
                    },
                    child: const Text("Gridview Demo")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/streamBuilderDemoScreen');
                    },
                    child: const Text('Stream Builder demo')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/themeDemoScreen');
                    },
                    child: const Text('Theme demo')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/isolateDemoScreen');
                    },
                    child: const Text('Isolate demo')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/apiDemoScreen');
                    },
                    child: const Text('Api demo')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/showStudentScreen');
                  },
                  child: const Text('Model Class Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addEmployeeScreen');
                  },
                  child: const Text('Sql Light Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hiveDemoScreen');
                  },
                  child: const Text('Hive Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/httpdioDemoScreen');
                  },
                  child: const Text('http-dio Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/animation');
                  },
                  child: const Text('Animation demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/responsiveDesingDemo');
                  },
                  child: const Text('Responsive Design demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sliversDemo');
                  },
                  child: const Text('Slivers Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/blocDemo');
                  },
                  child: const Text('Bloc Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cubitDemo');
                  },
                  child: const Text('Cubit Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/appLifeCycleDemo');
                  },
                  child: const Text('Applife Cycle Demo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/localizationDemo');
                  },
                  child: const Text('Localization'),
                ),
                 ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/localNotificationDemo');
                  },
                  child: const Text('Local Notification'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
