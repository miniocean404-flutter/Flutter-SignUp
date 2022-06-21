part of fluro_routers;
// 配合 Navigator.of(context).push 使用
// 例如: Navigator.of(context).push(showHero(ViewImage(url: Assets.stateIconError)));

mixin RouteAnimationDialog {
  // AlertBox, 只显示widget，背景透明
  PageRouteBuilder showDialogRouter(Widget widget, {Color? bgColor}) {
    return PageRouteBuilder(
      // !是否包含一个背景遮盖住之前的路由
      opaque: false,
      barrierColor: bgColor ?? Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        // 渐隐渐显动画
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.1, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
    );
  }

// 原生路由弹窗Api
  void showDialogNative(BuildContext context, Widget widget, {Color? bgColor}) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Builder(
          builder: (BuildContext context) {
            // 缩放动画
            return ScaleTransition(
              scale: Tween<double>(begin: 0.1, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: widget,
            );
          },
        );
      },
    );
  }

// 打开底部表单
  showBottomSheet(BuildContext context, Widget widget) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10000, // 阴影值
      clipBehavior: Clip.none,
      isDismissible: true, // 是否可以点击背景关闭
      isScrollControlled: false, // 参数指定是否使用可拖动的可滚动的组件，如果子组件是ListView或者GridView，此参数应该设置为true，设置为true后，最大高度可以占满全屏。
      enableDrag: false, // 底部表单是否可以拖拽
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      // transitionAnimationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 300)),
      // transitionAnimationController:,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

// Hero 动画使用，在当前页面写下 hero 并标记标签，路由跳转的第二个页面也要有相同的 tag
  Route showHero(Widget widget) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      // 阴影颜色
      barrierColor: Colors.black.withOpacity(0.7),
      // pageBuilder 表示跳转的页面。
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => widget,
      // transitionsBuilder 表示页面的动画效果，默认值代码：
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> __, Widget child) {
        // 透明曲线, Curves 用于颜色等曲线 动画区间 Interval
        const opacityCurve = Interval(0.0, 1, curve: Curves.fastOutSlowIn);

        // 可无 AnimatedBuilder 只是展示如何使用
        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: opacityCurve.transform(animation.value),
              child: child,
            );
          },
        );
      },
    );
  }

// 底部弹出窗
  Route bottomPopUpRouter(Widget widget, {opaque = false}) {
    return PageRouteBuilder(
      opaque: opaque,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero; //  Offset.zero === Offset(0.0, 0.0)
        var curve = Curves.ease;

        // Tween 用于大小
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        // 平移动画，
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
