import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_button.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:flutter_demo/responsive_design/personal_details_screen.dart';

class AdaptiveFormScreen extends StatelessWidget {
  AdaptiveFormScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressControlelr = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController feedBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Center(
            child: Card(
              color: Colors.deepPurple.shade100,
              child: SizedBox(
                height: constraints.maxHeight * 1,
                width: constraints.maxWidth * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Registration",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter name',
                        icon: Icons.person),
                    CustomTextfield(
                        controller: emailController,
                        hintText: 'Enter email',
                        icon: Icons.email),
                    CustomTextfield(
                        controller: phonecontroller,
                        hintText: 'Enter mobile no',
                        icon: Icons.phone),
                    CustomTextfield(
                        controller: addressControlelr,
                        hintText: 'Enter address',
                        icon: Icons.home),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: feedBackController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Feed back',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                    ),
                    CustomButton(title: 'Submit', onTap: () {})
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Card(
              color: Colors.deepPurple.shade100,
              child: Container(
                height: constraints.maxHeight * 1,
                width: constraints.maxWidth * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Personal Details",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter name',
                        icon: Icons.person),
                    CustomTextfield(
                        controller: emailController,
                        hintText: 'Enter email',
                        icon: Icons.email),
                    CustomTextfield(
                        controller: phonecontroller,
                        hintText: 'Enter mobile no',
                        icon: Icons.phone),
                    CustomTextfield(
                        controller: addressControlelr,
                        hintText: 'Enter address',
                        icon: Icons.home),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalDetailsScreen(),
                            ),
                          );
                        },
                        child: const Text("Next"))
                  ],
                ),
              ),
            ),
          );
        }
      },
    ));
  }
}
