part of theme_extensions;

// https://mp.weixin.qq.com/s/ZZfRefPKY3dREBjwmJzESw
// 开发者也可以通过  Theme.of(context) 去读取 ThemeData 的一些全局样式，从而让自己的控件配置更加灵活，「但是如果  ThemeData 里没有符合你需求的参数，
// Flutter 3 给我们提供了一个解决方案： ThemeExtensions
// 开发者可以通过继承 ThemeExtension 并 override 对应的  copyWith 和 lerp 方法来自定义需要拓展的  ThemeData 参数
// 通过下面代码之后就可以将上面的  StatusColors 配置到 Theme 的  extensions 上，然后通过 Theme.of(context).extension<StatusColors>() 读取配置的参数。

@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  static const light = StatusColors(open: Colors.green, closed: Colors.red);
  static const dark = StatusColors(open: Colors.white, closed: Colors.brown);

  const StatusColors({required this.open, required this.closed});

  final Color? open;
  final Color? closed;

  @override
  StatusColors copyWith({Color? success, Color? info}) {
    return StatusColors(open: success ?? open, closed: info ?? closed);
  }

  @override
  StatusColors lerp(ThemeExtension<StatusColors>? other, double t) {
    if (other is! StatusColors) return this;

    return StatusColors(
      open: Color.lerp(open, other.open, t),
      closed: Color.lerp(closed, other.closed, t),
    );
  }

  @override
  String toString() => 'StatusColors(' 'open: $open, closed: $closed' ')';
}
