import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_button.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';

class PersonalDetailsScreen extends StatelessWidget {
   PersonalDetailsScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameControlelr = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
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
                    "Acedmic Details",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),      
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter  class 10 %',
                      icon: Icons.remove_red_eye),
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter class 12 %',
                      icon: Icons.mobile_friendly),
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter Graduation %',
                      icon: Icons.home_max),
                  CustomButton(title: 'Submit', onTap: () {})
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
