import 'package:flutter/material.dart';
import '/core/constant/color.dart';

import '../../core/constant/fonts.dart';
import '../../core/constant/string.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary, // Change to your brand color
      body: SafeArea(
        child: Stack(
          children: [
            // Center Logo
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon/logo.png", // your logo path
                    width: 100,
                    height: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "KYC APP",
                    style: s.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,

                      color: white,
                    ),
                  ),
                ],
              ),
            ),
        
            // Bottom Text
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Text(
                      "India's Doctors Trusted App",
                      style: h.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                   // optional loader
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
