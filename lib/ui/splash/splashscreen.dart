import 'dart:async';

import 'package:e_commerce/ui/login/loginscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const splashScreen = "/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 1200),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Container(
            height: 200,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle
                    ),
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Image.asset(
                        "assets/icons/splash_logo.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "E-commerce Application by Fively",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
