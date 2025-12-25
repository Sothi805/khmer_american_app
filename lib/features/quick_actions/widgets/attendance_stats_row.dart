import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AttendanceStatsRow extends StatelessWidget {
  final int presentCount;
  final int lateCount;
  final int absentCount;
  final VoidCallback? onViewFullReport;

  const AttendanceStatsRow({
    super.key,
    required this.presentCount,
    required this.lateCount,
    required this.absentCount,
    this.onViewFullReport,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildStatColumn(
                label: 'PRESENT',
                value: '$presentCount',
                color: Colors.green,
              ),
              SizedBox(width: 5.w),
              _buildStatColumn(
                label: 'LATE',
                value: '$lateCount',
                color: Colors.orange,
              ),
              SizedBox(width: 5.w),
              _buildStatColumn(
                label: 'ABSENT',
                value: '$absentCount',
                color: Colors.red,
              ),
            ],
          ),
          GestureDetector(
            onTap: onViewFullReport,
            child: Row(
              children: [
                Text(
                  'VIEW FULL REPORT',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20.sp,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn({
    required String label,
    required String value,
    required Color color,
  }) {
    return SizedBox(
      width: 15.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
