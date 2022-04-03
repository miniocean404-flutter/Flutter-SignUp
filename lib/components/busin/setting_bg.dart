import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingBg extends StatefulWidget {
  final Widget? child;
  final List<Widget>? childs;

  const SettingBg({
    Key? key,
    this.child,
    this.childs,
  }) : super(key: key);

  @override
  State<SettingBg> createState() => _SettingBgState();
}

class _SettingBgState extends State<SettingBg> {
  final List<Widget> list = [];

  @override
  void initState() {
    super.initState();

    addLine();
  }

  void addLine() {
    final childs = widget.childs;
    if (childs != null) {
      for (var i = 0; i <= childs.length - 1; i++) {
        list.add(childs[i]);

        if (i != childs.length - 1) {
          list.add(
            Row(
              children: [
                SizedBox(width: 53.w),
                Flexible(
                  child: Container(
                    color: const Color(0xffC6C6C8),
                    height: 0.5.h,
                  ),
                ),
              ],
            ),
          );
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
        color: const Color(0xffFFFFFf),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: widget.childs != null
          ? Column(mainAxisAlignment: MainAxisAlignment.center, children: list
              //  widget.childs as List<Widget>,
              )
          : widget.child,
    );
  }
}
