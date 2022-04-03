import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingBar extends StatefulWidget {
  // 按钮条颜色
  final Color? color;
  final String title;

  const SettingBar({
    Key? key,
    this.color,
    required this.title,
  }) : super(key: key);

  @override
  State<SettingBar> createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: double.infinity,
      color: widget.color ?? Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: 11.w),
          Container(color: Colors.red, width: 30.r, height: 30.r),
          SizedBox(width: 12.w),
          Text(
            widget.title,
            style: TextStyle(fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
