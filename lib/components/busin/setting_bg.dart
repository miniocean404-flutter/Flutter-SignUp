import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sign_in/config/constant/index.dart';

class SettingBg extends StatefulWidget {
  final Widget? child;
  final List<Widget>? childs;
  // 虚线距离左侧的长度
  final double leftLine;

  const SettingBg({
    Key? key,
    this.child,
    this.childs,
    required this.leftLine,
  }) : super(key: key);

  @override
  State<SettingBg> createState() => _SettingBgState();
}

class _SettingBgState extends State<SettingBg> {
  late List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    addLine();
  }

  @override
  void didUpdateWidget(covariant SettingBg oldWidget) {
    super.didUpdateWidget(oldWidget);
    addLine();
  }

  void addLine() {
    list = [];
    final childs = widget.childs;
    if (childs != null) {
      for (var i = 0; i <= childs.length - 1; i++) {
        list.add(childs[i]);

        if (i != childs.length - 1) {
          list.add(Builder(builder: ((context) {
            return Row(
              children: [
                SizedBox(width: widget.leftLine),
                Flexible(
                  child: Container(
                    color: AppColor.of(context).currentMode.page,
                    height: 0.5.h,
                  ),
                ),
              ],
            );
          })));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // 超出部分的操作，
      //  antiAlias 隐藏锯齿，保真度高，
      //  hardEdge  隐藏锯齿，保真度低，
      //  none 不进行隐藏
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.of(context).currentMode.secondary,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: widget.childs != null ? Column(mainAxisAlignment: MainAxisAlignment.center, children: list) : widget.child,
    );
  }
}
