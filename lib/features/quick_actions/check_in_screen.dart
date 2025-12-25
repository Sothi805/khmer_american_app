import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Check-In',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_2, size: 48.sp, color: Colors.blue),
            SizedBox(height: 3.h),
            Text('Scan QR at the office', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Scan Now'),
            ),
          ],
        ),
      ),
    );
  }
}
