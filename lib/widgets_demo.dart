import 'dart:developer';

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
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName: Text("Siddharth"),
                  accountEmail: Text("smakavana454@gmail.com"),
                  currentAccountPictureSize: Size.square(40),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Text('S'),
                  ),
                )),
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
                log('Gesture detector button is pressed');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: const Text("Inkwell"),
              onTap: () {
                log("Inkwell button is pressed");
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
                  titlePadding: const EdgeInsets.all(0),
                  title: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: Colors.black),
                    child: const Icon(
                      Icons.warning_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  content: const Text(
                    "Do You Want To Recive The Recipt via Email?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Yes , I Do Want",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No , T Dont Wnat To",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
