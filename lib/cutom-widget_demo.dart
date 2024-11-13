import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_button.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';

class CustomWidgetDemo extends StatefulWidget {
  const CustomWidgetDemo({super.key});

  @override
  State<CustomWidgetDemo> createState() => _CustomWidgetdDemoState();
}

class _CustomWidgetdDemoState extends State<CustomWidgetDemo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void validate() {
    _formKey.currentState?.validate();
    if(_formKey.currentState!.validate()){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Submitted successfully')));
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sign Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                CustomTextfield(controller: nameController,hintText: 'Name',icon: Icons.person,),
                const SizedBox(height: 10,),
                CustomTextfield(controller: surnameController, hintText: 'Surname', icon: Icons.person_2),
                const SizedBox(height: 10,),
                CustomTextfield(controller: emailController, hintText: 'Email', icon: Icons.email),
                const SizedBox(height: 10,),
                CustomTextfield(controller: passwordController, hintText: 'Password', icon: Icons.password,suffixIcons: Icons.visibility_off,),
                const SizedBox(height: 10,),
                CustomButton(title: 'Submit',onTap: ()=> validate,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}