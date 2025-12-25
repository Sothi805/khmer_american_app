import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'nav_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.h),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 7.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.h),
              color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: .05), // glass tint
              border: Border.all(
                color: Colors.black.withValues(alpha: .1), // glass rim
                width: 0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  spreadRadius: 15,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  isSelected: currentIndex == 0,
                  onTap: () => onChanged(0),
                ),
                NavItem(
                  icon: Icons.school_rounded,
                  label: 'Classes',
                  isSelected: currentIndex == 1,
                  onTap: () => onChanged(1),
                ),
                NavItem(
                  icon: Icons.assessment_rounded,
                  label: 'Reports',
                  isSelected: currentIndex == 2,
                  onTap: () => onChanged(2),
                ),
                NavItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  isSelected: currentIndex == 3,
                  onTap: () => onChanged(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
