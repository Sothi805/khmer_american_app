import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 7.5.w : 5.w,
          vertical: .5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.h),
          color: isSelected
              ? const Color.fromARGB(255, 50, 50, 50).withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with animated background
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              // padding: EdgeInsets.all(isSelected ? 1.2.h : 0.8.h),
              // decoration: BoxDecoration(
              //   color: isSelected
              //       ? Colors.blue.withValues(alpha: 0.2)
              //       : Colors.transparent,
              //   borderRadius: BorderRadius.circular(2.w),
              // ),
              child: Icon(
                icon,
                size: 22.sp,
                color: isSelected ? Colors.blue : const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 0.3.h),
            // Label animation
            Text(
              label,
              style: TextStyle(
                fontSize: 13.5.sp,
                color: isSelected ? Colors.blue : const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
