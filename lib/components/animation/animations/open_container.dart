import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerComponent extends StatefulWidget {
  final Widget open;
  final Widget close;

  const OpenContainerComponent({Key? key, required this.open, required this.close}) : super(key: key);

  @override
  State<OpenContainerComponent> createState() => _OpenContainerComponentState();
}

class _OpenContainerComponentState extends State<OpenContainerComponent> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openColor: Colors.white,
      // 当容器被打开时，它将从这个高度过渡到[openElevation]。当容器关闭时，它会从[openElevation]转换回当前的高度。
      closedElevation: 20,
      // 当容器被打开时，它将从这个形状过渡到[openShape]。当容器关闭时，它将转换回此形状。
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      transitionDuration: const Duration(milliseconds: 700),
      openBuilder: (_, closeContainer) {
        return widget.open;
      },
      // 容器关闭时的形状。
      closedBuilder: (_, openContainer) {
        return widget.close;
      },
    );
  }
}
