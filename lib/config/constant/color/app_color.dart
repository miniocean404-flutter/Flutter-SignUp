part of constant;

enum ColorMode { light, dark }

class AppColor extends AppColorUtil {
  // 初始化一个单例实例
  static final AppColor _instance = AppColor._internal();

  // 工厂构造方法，当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory AppColor() => _instance;

  AppColorLight light = AppColorLight();
  AppColorDark dark = AppColorDark();
  late CurrentModeColor currentMode;

  AppColor._internal();

  AppColor.of(BuildContext context) {
    if (isDarkMode(context)) {
      currentMode = dark;
      return;
    }

    currentMode = light;
  }
}
