import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Container(
          width: double.infinity,
          child: Image.asset('Assets/image/Sparrow.jpg'),
        ),
      ),
    );
  }
}
