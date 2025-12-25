import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'features/home/home_screen.dart';
import 'features/splash/splash_screen.dart';
import 'features/quick_actions/check_in_screen.dart';
import 'features/quick_actions/attendance_screen.dart';
import 'features/quick_actions/score_exam_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Khmer American School App',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFFF5F7F8),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/check-in': (context) => const CheckInScreen(),
            '/attendance': (context) => const AttendanceScreen(),
            '/score-exam': (context) => const ScoreExamScreen(),
          },
        );
      },
    );
  }
}
