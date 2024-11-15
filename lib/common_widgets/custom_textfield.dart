import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final IconData? suffixIcons;
  final String validator;
  const CustomTextfield({super.key, required this.controller, required this.hintText, required this.icon, this.suffixIcons, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(hintText == "email"){
             if(value == null || value.isEmpty){
                  return 'please enter $validator';
              }else{
                const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                final regex = RegExp(pattern);
                return !regex.hasMatch(value) ? 'Enter valid Email' : null ;
              }
          }
          if(validator == "password"){
            if(value == null || value.isEmpty){
                  return 'please enter $validator';
              }else{
                  if (value.length < 8){
                      return 'password lenght must be 8 or more';
                  }
              }
          }
          if(value == null || value.isEmpty){
            return 'please enter $validator';
          }
        },
        
        decoration: InputDecoration(
      
          hintText: hintText,
          prefixIcon: Icon(icon),
          suffix: Icon(suffixIcons),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.amberAccent),
          )
        ),
      ),
    );
  }
}