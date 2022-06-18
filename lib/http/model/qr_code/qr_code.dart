class ScanQRCodeResult {
  int? code;
  String? message;
  Data? data;
  List? nullInfo;

  ScanQRCodeResult({this.code, this.message, this.data});

  ScanQRCodeResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    final jsonData = json['data'];
    data = jsonData != null && (jsonData.runtimeType != List<dynamic>) ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    } else {
      data['data'] = nullInfo;
      return data;
    }
    return data;
  }
}

class Data {
  bool? isSuccess;
  String? timeStamp;
  String? message;
  int? delayClose;
  AppUserInfo? appUserInfo;

  Data({this.isSuccess, this.timeStamp, this.message, this.delayClose, this.appUserInfo});

  Data.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    timeStamp = json['timeStamp'];
    message = json['message'];
    delayClose = json['delayClose'];
    appUserInfo = json['appUseInfo'] != null ? AppUserInfo.fromJson(json['appUseInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['timeStamp'] = timeStamp;
    data['message'] = message;
    data['delayClose'] = delayClose;
    return data;
  }
}

class AppUserInfo {
  String? backgroundUrl;
  String? backgroundType;
  String? textColor;

  AppUserInfo.fromJson(Map<String, dynamic> json) {
    backgroundUrl = json['backgroundUrl'];
    backgroundType = json['backgroundType'];
    textColor = json['textColor'];
  }
}
