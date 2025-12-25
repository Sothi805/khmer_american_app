import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StudentAttendanceCard extends StatefulWidget {
  final String studentName;
  final String studentId;
  final int attendancePercentage;
  final String profileImageUrl;
  final String? initialStatus;
  final Function(String)? onStatusChanged;

  const StudentAttendanceCard({
    super.key,
    required this.studentName,
    required this.studentId,
    required this.attendancePercentage,
    required this.profileImageUrl,
    this.initialStatus = 'Present',
    this.onStatusChanged,
  });

  @override
  State<StudentAttendanceCard> createState() => _StudentAttendanceCardState();
}

class _StudentAttendanceCardState extends State<StudentAttendanceCard> {
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.initialStatus ?? 'Present';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
      child: Column(
        children: [
          // Student Info Section
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  widget.profileImageUrl,
                  width: 12.w,
                ),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.studentName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ID: ${widget.studentId} · ${widget.attendancePercentage}% Attendance',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          // Status Selection Buttons
          Container(
            padding: EdgeInsets.all(.3.h),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(0.5.h),
            ),
            child: Row(
              children: [
                _buildStatusButton(
                  icon: Icons.check_rounded,
                  label: 'Present',
                  color: Colors.green,
                  isSelected: selectedStatus == 'Present',
                  onTap: () {
                    setState(() => selectedStatus = 'Present');
                    widget.onStatusChanged?.call('Present');
                  },
                ),
                _buildStatusButton(
                  icon: Icons.timer_off_rounded,
                  label: 'Late',
                  color: Colors.orange,
                  isSelected: selectedStatus == 'Late',
                  onTap: () {
                    setState(() => selectedStatus = 'Late');
                    widget.onStatusChanged?.call('Late');
                  },
                ),
                _buildStatusButton(
                  icon: Icons.close_rounded,
                  label: 'Absent',
                  color: Colors.red,
                  isSelected: selectedStatus == 'Absent',
                  onTap: () {
                    setState(() => selectedStatus = 'Absent');
                    widget.onStatusChanged?.call('Absent');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton({
    required IconData icon,
    required String label,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2.h,
            vertical: .75.h,
          ),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(0.5.h),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: color,
              ),
              SizedBox(width: 1.h),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? color : Colors.grey[600],
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
