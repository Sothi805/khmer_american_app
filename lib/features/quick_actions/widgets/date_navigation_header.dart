import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';

class DateNavigationHeader extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const DateNavigationHeader({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  State<DateNavigationHeader> createState() => _DateNavigationHeaderState();
}

class _DateNavigationHeaderState extends State<DateNavigationHeader> {
  late DateTime currentDate;
  late final DateTime _firstDate;
  late final DateTime _lastDate;

  @override
  void initState() {
    super.initState();
    currentDate = widget.initialDate;

    _firstDate = DateTime(2025, 1, 1); // adjust as needed
    _lastDate = DateTime.now();
  }

  void _previousDay() {
    if (!currentDate.isAfter(_firstDate)) return;

    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 1));
    });
    widget.onDateChanged(currentDate);
  }

  void _nextDay() {
    if (!currentDate.isBefore(_lastDate)) return;

    setState(() {
      currentDate = currentDate.add(const Duration(days: 1));
    });
    widget.onDateChanged(currentDate);
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 35.h,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: currentDate,
            maximumDate: now,
            onDateTimeChanged: (date) {
              setState(() => currentDate = date);
              widget.onDateChanged(date);
            },
          ),
        ),
      );
    } else {
      final picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2025),
        lastDate: now,
      );

      if (picked != null) {
        setState(() => currentDate = picked);
        widget.onDateChanged(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isToday = _isToday(currentDate);

    final bool canGoPrev = currentDate.isAfter(_firstDate);
    final bool canGoNext = currentDate.isBefore(_lastDate);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ⬅️ Previous
          GestureDetector(
            onTap: canGoPrev ? _previousDay : null,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.chevron_left_rounded,
              size: 24.sp,
              color: canGoPrev ? Colors.grey[600] : Colors.grey[400],
            ),
          ),

          // 📅 Date (tap to pick)
          GestureDetector(
            onTap: () => _pickDate(context),
            child: Column(
              children: [
                if (isToday)
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                Row(
                  children: [
                    Text(
                      _formatDate(currentDate),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ➡️ Next
          GestureDetector(
            onTap: canGoNext ? _nextDay : null,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.chevron_right_rounded,
              size: 24.sp,
              color: canGoNext ? Colors.grey[600] : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  bool _isToday(DateTime date) {
    final today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }
}
