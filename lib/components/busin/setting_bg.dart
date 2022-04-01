import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingBg extends StatefulWidget {
  final List<Widget> child;

  const SettingBg({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<SettingBg> createState() => _SettingBgState();
}

class _SettingBgState extends State<SettingBg> {
  final List<Widget> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFf),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.child,
      ),
    );
  }
}
