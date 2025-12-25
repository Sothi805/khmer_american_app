import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClassCard extends StatelessWidget {
  final String classType;
  final String level;
  final String startTime;
  final String endTime;
  final String room;
  final String startsIn;
  final Color backgroundColor;

  const ClassCard({
    super.key,
    required this.classType,
    required this.level,
    required this.startTime,
    required this.endTime,
    required this.room,
    required this.startsIn,
    this.backgroundColor = const Color.fromARGB(255, 28, 111, 255),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(1.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 15.w,
            height: 15.w,
            child: Icon(
              Icons.alarm_on_rounded,
              size: 32.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 2.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      classType,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.5.w,
                        vertical: 0.5.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .3),
                        borderRadius: BorderRadius.circular(0.5.h),
                      ),
                      child: Text(
                        startsIn,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                Text(
                  level,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 1.h),
                        Text(
                          '$startTime - $endTime',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'ROOM: $room',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
