import 'package:flutter/material.dart';

// router_animation 需要搭配 router_animation 的 HERO

class ViewImage extends StatefulWidget {
  final String? tag;
  final String? url;
  const ViewImage({Key? key, this.tag, this.url}) : super(key: key);

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> with SingleTickerProviderStateMixin {
  // 转换矩阵控制器 _transformationController.value 默认值:Matrix4.identity()
  final TransformationController _transformationController = TransformationController();
  late Animation<Matrix4> _animation;

  late AnimationController _animationController;
  late TapDownDetails _doubleTapDetails;

  @override
  void initState() {
    super.initState();

    // 添加放大监听,将控制器交给 Matrix4Tween
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() => {_transformationController.value = _animation.value});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDoubleTap() {
    // 矩阵
    Matrix4 endMatrix;

    // 单位矩阵 Matrix4.identity()
    // 不是 单位矩阵就代表放大过了，要回归原始
    if (_transformationController.value != Matrix4.identity()) {
      endMatrix = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // 矩阵转换()，并且缩放2.5倍
      endMatrix = Matrix4.identity()
        ..translate(-position.dx * 1.3, -position.dy * 1.3)
        ..scale(2.5);
    }

    // 矩阵动画记录开始位置结束位置
    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: endMatrix,
    ).animate(CurveTween(curve: Curves.fastOutSlowIn).animate(_animationController));

    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        // 双击事件
        onDoubleTap: _handleDoubleTap,
        // 两个手指按下 没松开时
        onDoubleTapDown: (details) => _doubleTapDetails = details,
        behavior: HitTestBehavior.opaque,
        child: Hero(
          tag: widget.tag ?? '',
          child: Center(
            child: InteractiveViewer(
              // true 为只在水平和垂直方向上拖拽,false 为可沿对角线拖拽
              alignPanAxis: false,
              // 最大最小缩放倍数
              maxScale: 20,
              minScale: .5,
              // 是否可以缩放
              scaleEnabled: true,
              clipBehavior: Clip.none,
              transformationController: _transformationController,
              child: Image.asset(widget.url!),

              // 当用户开始平移或缩放手势时调用
              // onInteractionStart: (ScaleStartDetails details) {},
              // 当用户更新组件上的平移或缩放手势时调用
              // onInteractionUpdate: (ScaleUpdateDetails details) {}
              // 当用户在组件上结束平移或缩放手势时调用
              // onInteractionEnd: (ScaleEndDetails details) {},
            ),
          ),
        ),
      ),
    );
  }
}
