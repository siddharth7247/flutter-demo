import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:flutter_demo/models/userModel.dart';
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
  late Box<User> userBox;

  @override
  void initState() {
    userBox = Hive.box<User>('users');
    log("UserBox : ${userBox.name}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Details",
          style: TextStyle(
              fontFamily: 'Manrope', color: Colors.deepPurple.shade100),
        ),
      ),
      body: _featchEmployee(),
      floatingActionButton: _addUserButton(),
    );
  }

  Widget _featchEmployee() {
    if (userBox == null) {
      return const CircularProgressIndicator();
    }
    return ValueListenableBuilder(
      valueListenable: userBox.listenable(),
      builder: (context, box, widget) {
        return ListView.builder(
          itemCount: userBox.length ?? 0,
          itemBuilder: (context, index) {
            User? user = userBox.getAt(index);
            var isFav = user?.isFaV;
            return Card(
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    if (isFav ?? false) {
                      userBox.putAt(
                        index,
                        User(
                          userName: user!.userName.toString(),
                          email: user.email.toString(),
                          password: user.password.toString(),
                          isFaV: false,
                        ),
                      );
                    } else {
                      userBox.putAt(
                        index,
                        User(
                          userName: user!.userName.toString(),
                          email: user.email.toString(),
                          password: user.password.toString(),
                          isFaV: true,
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: (isFav ?? false) ? Colors.red : Colors.grey,
                  ),
                ),
                title: Text(user!.userName.toString()),
                subtitle: Text(user.password.toString()),
                trailing: IconButton(
                    onPressed: () {
                      userBox.deleteAt(index);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          },
        );
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
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
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Product Details",
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.shade100),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextfield(
                        controller: userController,
                        hintText: 'name',
                        icon: Icons.person),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextfield(
                        controller: emailController,
                        hintText: 'description',
                        icon: Icons.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextfield(
                        controller: passwordController,
                        hintText: 'price',
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
                      User user = User(
                          userName: userController.text,
                          email: emailController.text,
                          password: passwordController.text.toString(),
                          isFaV: false);
                      await userBox.add(user);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                      clear();
                    },
                    child: Text(
                      "Add Product",
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

  void clear() {
    userController.clear();
    passwordController.clear();
    emailController.clear();
  }
}
