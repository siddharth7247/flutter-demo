import 'package:flutter/material.dart';

class Widgetsdemo extends StatefulWidget {
  const Widgetsdemo({super.key});

  @override
  State<Widgetsdemo> createState() => _WidgetsdemoState();
}

class _WidgetsdemoState extends State<Widgetsdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Demo"),
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple
              ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple
                  ),
                    accountName: Text("Siddharth"),
                    accountEmail: Text("smakavana454@gmail.com"),
                    currentAccountPictureSize: Size.square(40),
                    currentAccountPicture:
                        CircleAvatar(backgroundColor: Colors.amber,child: Text('S'),),
                )
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("edit"),
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text("delete"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext content) {
                        return const SizedBox(
                          height: 250,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Profile"),
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text("Edit"),
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text("Delete"),
                              ),
                              ListTile(
                                leading: Icon(Icons.logout),
                                title: Text("Lgout"),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: const Text("Bottom Sheet")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: const Text("Gesture Ditector"),
              onTap: () {
                print('Gesture detector button is pressed');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: const Text("Inkwell"),
              onTap: () {
                print("Inkwell button is pressed");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Alert Dialog"),
                  content: const Text("Flaoting Action button is presssed"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("ok")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("cancel")),
                  ],
                );
              });
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
