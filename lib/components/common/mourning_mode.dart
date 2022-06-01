import 'package:flutter/material.dart';

// 哀悼模式，配合 provider 转换全局灰色，同样他也是颜色滤镜
class MourningMode extends StatefulWidget {
  final Widget child;
  const MourningMode({Key? key, required this.child}) : super(key: key);

  @override
  State<MourningMode> createState() => _MourningModeState();
}

class _MourningModeState extends State<MourningMode> {
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.color),
      child: widget.child,
    );
  }
}
