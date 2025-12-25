import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/icons/ic_foreground.png',
                width: 24.w,
                height: 24.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Assignment App',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 28, 111, 255),
              ),
            ),
            SizedBox(height: 2.h),
            SizedBox(
              width: 40.w,
              child: LinearProgressIndicator(
                minHeight: .5.h,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 28, 111, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
