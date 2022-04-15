import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpDownClassCard extends StatefulWidget {
  final String name;
  final String role;
  final double? bottom;
  final double? right;
  final double? left;

  const UpDownClassCard({
    Key? key,
    required this.name,
    required this.role,
    this.bottom,
    this.right,
    this.left,
  }) : super(key: key);

  @override
  State<UpDownClassCard> createState() => _UpDownClassCardState();
}

class _UpDownClassCardState extends State<UpDownClassCard> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.bottom,
      left: widget.left,
      right: widget.right,
      child: Container(
        width: 340.w,
        height: 406.h,
        margin: EdgeInsets.fromLTRB(22.w, 0, 0, 22.w),
        padding: EdgeInsets.fromLTRB(39.w, 0, 0, 18.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.role,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
