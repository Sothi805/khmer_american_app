import 'package:flutter/material.dart';
import '../../shared/widgets/custom_bottom_bar.dart';
import 'pages/home_page.dart';
import 'pages/classes_page.dart';
import 'pages/reports_page.dart';
import 'pages/profile_page.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    ClassesPage(),
    ReportsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onChanged: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
