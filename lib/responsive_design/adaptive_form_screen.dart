import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_button.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:flutter_demo/responsive_design/personal_details_screen.dart';

// ignore: must_be_immutable
class AdaptiveFormScreen extends StatelessWidget {
  AdaptiveFormScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameControlelr = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600){
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
                      "Registration",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter name',
                        icon: Icons.person),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter email',
                        icon: Icons.email),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter mobile no',
                        icon: Icons.phone),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter address',
                        icon: Icons.home),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter paddwor',
                        icon: Icons.remove_red_eye),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter mobile no',
                        icon: Icons.mobile_friendly),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter address',
                        icon: Icons.home_max),
                    CustomButton(title: 'Submit', onTap: () {})
                  ],
                ),
              ),
            ),
          );
        }else{
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
                      "Registration",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter name',
                        icon: Icons.person),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter email',
                        icon: Icons.email),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter mobile no',
                        icon: Icons.phone),
                    CustomTextfield(
                        controller: nameController,
                        hintText: 'Enter address',
                        icon: Icons.home),
                   ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => PersonalDetailsScreen()));
                   }, child: Text("submit"))
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
