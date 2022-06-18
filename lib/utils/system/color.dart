part of util.system;
// 颜色值转换

extension ColorToString on String {
  Color toColor() {
    String colorString = this;

    if (colorString[0] != '#') throw '字符串转换颜色必须有 # 号';

    int value = 0x00000000;
    if (colorString[0] == '#') colorString = colorString.substring(1);

    value = int.tryParse(colorString, radix: 16)!;
    if (value < 0xFF000000) value += 0xFF000000;

    return Color(value);
  }
}
