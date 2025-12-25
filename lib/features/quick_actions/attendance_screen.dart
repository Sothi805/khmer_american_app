import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/student_attendance_card.dart';
import 'widgets/date_navigation_header.dart';
import 'widgets/class_info_card.dart';
import 'widgets/attendance_stats_row.dart';
import 'widgets/submit_attendance_button.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late DateTime _selectedDate;
  final Map<String, String> _studentStatusMap = {
    'John Doe': 'Present',
    'Jane Smith': 'Present',
    'Mike Johnson': 'Present',
    'Sarah Williams': 'Present',
    'Alex Brown': 'Present',
  };

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _handleDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  void _handleViewFullReport() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('View full report tapped')));
  }

  void _updateStudentStatus(String studentName, String status) {
    setState(() {
      _studentStatusMap[studentName] = status;
    });
  }

  int get _presentCount =>
      _studentStatusMap.values.where((s) => s == 'Present').length;
  int get _lateCount =>
      _studentStatusMap.values.where((s) => s == 'Late').length;
  int get _absentCount =>
      _studentStatusMap.values.where((s) => s == 'Absent').length;

  void _handleSubmitAttendance() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Attendance submitted')));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Student's Attendance",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0).withAlpha(25),
        border: null,
      ),
      child: Material(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                DateNavigationHeader(
                  initialDate: _selectedDate,
                  onDateChanged: _handleDateChanged,
                ),
                SizedBox(height: 2.h),
                ClassInfoCard(
                  className: 'PART TIME',
                  level: 'Beginner',
                  startTime: '10:00 AM',
                  endTime: '11:30 AM',
                  roomNumber: 'A5',
                ),
                SizedBox(height: 2.h),
                AttendanceStatsRow(
                  presentCount: _presentCount,
                  lateCount: _lateCount,
                  absentCount: _absentCount,
                  onViewFullReport: _handleViewFullReport,
                ),
                // Student attendance cards
                StudentAttendanceCard(
                  studentName: 'John Doe',
                  studentId: '123456789',
                  attendancePercentage: 92,
                  profileImageUrl:
                      'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
                  onStatusChanged: (status) =>
                      _updateStudentStatus('John Doe', status),
                ),
                StudentAttendanceCard(
                  studentName: 'Jane Smith',
                  studentId: '987654321',
                  attendancePercentage: 88,
                  profileImageUrl:
                      'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
                  onStatusChanged: (status) =>
                      _updateStudentStatus('Jane Smith', status),
                ),
                StudentAttendanceCard(
                  studentName: 'Mike Johnson',
                  studentId: '456789123',
                  attendancePercentage: 85,
                  profileImageUrl:
                      'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
                  onStatusChanged: (status) =>
                      _updateStudentStatus('Mike Johnson', status),
                ),
                StudentAttendanceCard(
                  studentName: 'Sarah Williams',
                  studentId: '789123456',
                  attendancePercentage: 95,
                  profileImageUrl:
                      'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
                  onStatusChanged: (status) =>
                      _updateStudentStatus('Sarah Williams', status),
                ),
                StudentAttendanceCard(
                  studentName: 'Alex Brown',
                  studentId: '321654987',
                  attendancePercentage: 80,
                  profileImageUrl:
                      'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
                  onStatusChanged: (status) =>
                      _updateStudentStatus('Alex Brown', status),
                ),
                SubmitAttendanceButton(onPressed: _handleSubmitAttendance),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
