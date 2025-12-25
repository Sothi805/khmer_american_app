import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScoreExamScreen extends StatelessWidget {
  const ScoreExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Score Exam',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.class_rounded, size: 48.sp, color: Colors.orange),
            SizedBox(height: 3.h),
            Text('Mark your students here', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Start Scoring'),
            ),
          ],
        ),
      ),
    );
  }
}
