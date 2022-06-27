import 'package:flutter/material.dart';
import 'package:flutter_sign_in/http/config/http_request.dart';
import 'package:flutter_ume/flutter_ume.dart';
import 'package:flutter_ume_kit_console/console/console_panel.dart';
import 'package:flutter_ume_kit_device/components/cpu_info/cpu_info_page.dart';
import 'package:flutter_ume_kit_device/components/device_info/device_info_panel.dart';
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart';
import 'package:flutter_ume_kit_perf/components/memory_info/memory_info_page.dart';
import 'package:flutter_ume_kit_perf/components/performance/performance.dart';
import 'package:flutter_ume_kit_show_code/show_code/show_code.dart';
import 'package:flutter_ume_kit_ui/components/align_ruler/align_ruler.dart';
import 'package:flutter_ume_kit_ui/components/color_picker/color_picker.dart';
import 'package:flutter_ume_kit_ui/components/color_sucker/color_sucker.dart';
import 'package:flutter_ume_kit_ui/components/touch_indicator/touch_indicator.dart';
import 'package:flutter_ume_kit_ui/components/widget_detail_inspector/widget_detail_inspector.dart';
import 'package:flutter_ume_kit_ui/components/widget_info_inspector/widget_info_inspector.dart';

Widget initUme(Widget app, {bool? disabled}) {
  PluginManager.instance // 注册插件
    ..register(const WidgetInfoInspector())
    ..register(const WidgetDetailInspector())
    ..register(const ColorSucker())
    ..register(AlignRuler())
    ..register(const ColorPicker())
    ..register(const TouchIndicator())
    ..register(const ShowCode())
    ..register(const MemoryInfoPage())
    ..register(CpuInfoPage())
    ..register(const DeviceInfoPanel())
    ..register(DioInspector(dio: Http().dio))
    ..register(Console())
    ..register(Performance());

  if (disabled != null && disabled) return app;
  return UMEWidget(enable: true, child: app);
}
