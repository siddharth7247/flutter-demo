import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDemoScreen extends StatefulWidget {
  const HiveDemoScreen({super.key});

  @override
  State<HiveDemoScreen> createState() => _HiveDemoScreenState();
}

class _HiveDemoScreenState extends State<HiveDemoScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Box? empsBox;

  @override
  void initState() {
    Hive.openBox("Employee_Box").then((_box) {
      setState(() {
        empsBox = _box;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hive Database",
          style: TextStyle(
              fontFamily: 'Manrope', color: Colors.deepPurple.shade100),
        ),
      ),
      body: _featchEmployee(),
      floatingActionButton: _addUserButton(),
    );
  }

  Widget _featchEmployee() {
    if (empsBox == null) {
      return const CircularProgressIndicator();
    }
    return ValueListenableBuilder(
      valueListenable: empsBox!.listenable(),
      builder: (context, box, widget) {
        final empKeysList = box.keys.toList();
        return ListView.builder(
          itemCount: empKeysList.length,
          itemBuilder: (context, index) {
           return ListTile(
            title: Text(index.toString()),
           );
        },);
      },
    );
  }

  Widget _addUserButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(0),
              height: 400,
              decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28),
                          )),
                      child: Center(
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade100),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextfield(
                        controller: userController,
                        hintText: 'Username',
                        icon: Icons.person),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextfield(
                        controller: emailController,
                        hintText: 'Email',
                        icon: Icons.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextfield(
                        controller: passwordController,
                        hintText: 'Password',
                        icon: Icons.enhanced_encryption_rounded),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        backgroundColor: Colors.deepPurple),
                    onPressed: () async {
                      var hiveBox = await Hive.openBox('Users');
                      hiveBox.put('user1', 'Siddhart');
                      debugPrint(
                          "User from hive database : ${hiveBox.get('user1')}");
                      debugPrint(
                          "User from hive database index 1 : ${hiveBox.getAt(0)}");
                      debugPrint("User from ${hiveBox.containsKey('user1')}");
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          color: Colors.deepPurple.shade100,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
