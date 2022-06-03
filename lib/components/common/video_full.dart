import 'dart:ui';

import 'package:flutter/material.dart';

// 背景视频充满全屏
class VideoFull extends StatefulWidget {
  final double videoAspectRatio;
  final bool show;
  final Widget child;

  const VideoFull({Key? key, required this.videoAspectRatio, required this.show, required this.child}) : super(key: key);

  @override
  State<VideoFull> createState() => _VideoFullState();
}

class _VideoFullState extends State<VideoFull> {
  @override
  Widget build(BuildContext context) {
    double videoScale = widget.videoAspectRatio / window.physicalSize.aspectRatio;

    return widget.show
        ? Transform.scale(
            // 将宽度保持与设备宽度一致的最大放大数值 设备宽度可使用：window.physicalSize.aspectRatio || MediaQuery.of(context).size.aspectRatio
            scale: videoScale,
            child: Center(
              child: AspectRatio(
                aspectRatio: widget.videoAspectRatio,
                child: widget.child,
              ),
            ),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          );
  }
}
