import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_button.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';

class LoginFormAnimation extends StatefulWidget {
  const LoginFormAnimation({super.key});

  @override
  State<LoginFormAnimation> createState() => _LoginFormAnimationState();
}

class _LoginFormAnimationState extends State<LoginFormAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<Offset> btnSlideAnimation;
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    slideAnimation = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    btnSlideAnimation = Tween<Offset>(begin: const Offset(-1, 0),end: Offset.zero).animate(_controller);    
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoFadeAnimation,
              child: const FlutterLogo(
                size: 100,
              ),
            ),
            SlideTransition(
              position: slideAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter Name',
                      icon: Icons.person),
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter Email',
                      icon: Icons.email),
                ],
              ),
            ),
            SlideTransition(position: btnSlideAnimation,child: CustomButton(title: "Login", onTap: () {}))
          ],
        ),
      ),
    );
  }
}

