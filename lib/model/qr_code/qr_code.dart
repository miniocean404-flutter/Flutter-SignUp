class ScanQRCodeResult {
  int? code;
  String? message;
  Data? data;

  ScanQRCodeResult({this.code, this.message, this.data});

  ScanQRCodeResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? isSuccess;
  String? timeStamp;
  String? message;
  int? delayClose;

  Data({this.isSuccess, this.timeStamp, this.message, this.delayClose});

  Data.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    timeStamp = json['timeStamp'];
    message = json['message'];
    delayClose = json['delayClose'];
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
