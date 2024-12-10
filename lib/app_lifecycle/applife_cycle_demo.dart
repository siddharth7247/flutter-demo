import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class ApplifeCycleDemo extends StatefulWidget {
  const ApplifeCycleDemo({super.key});

  @override
  State<ApplifeCycleDemo> createState() => _ApplifeCycleDemoState();
}

class _ApplifeCycleDemoState extends State<ApplifeCycleDemo>
    with WidgetsBindingObserver {
  late Timer timer;
  int count = 1;
  bool isActive = true;
  String currentState = "Resumed";
  late AppLifecycleListener listener;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    listener = AppLifecycleListener(
        onDetach: onDetached,
        onResume: onResumed,
        onInactive: onInactive,
        onHide: onHidden,
        onPause: onPaused,
        onRestart: () => log("OnRestart"),
        onStateChange: (value) => log("Changed Application State"),
    );
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (isActive) {
          setState(
            () {
              count += 1;
            },
          );
        }
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.detached:
        onDetached();
      case AppLifecycleState.resumed:
        onResumed();
      case AppLifecycleState.inactive:
        onInactive();
      case AppLifecycleState.hidden:
        onHidden();
      case AppLifecycleState.paused:
        onPaused();
    }
  }


  void onDetached() {
    currentState = "Detached";
    log("OnDetached");
  }

  void onResumed() {
    isActive = true;
    currentState = "Resumed";
    log("OnResume");
  }

  void onInactive() {
    isActive = false;
    currentState = "Inactive";
    log("OnInactive");
  }

  void onHidden() {
    currentState = "Hidden";
    isActive = false;
    log("OnHidden");
  }

  void onPaused() {
    currentState = "Paused";
    isActive = false;
    log("OnPaused");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Timer : $count",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text("Current State : $currentState",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
