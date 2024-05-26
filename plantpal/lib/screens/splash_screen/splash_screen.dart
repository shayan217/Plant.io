// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plantpal/utils/routes.dart';

class Splash extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  Widget screen;
  Splash({required this.screen ,super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () =>Routes.pushReplacement(widget.screen, context) );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
        
      
          children: [
            Expanded(
              child: SizedBox(
                width: 150,
                child: Image.asset("assets/images/logo.png")
              ),
            ),
      
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}