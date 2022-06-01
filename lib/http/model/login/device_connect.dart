class DeviceConnect {
  int? code;
  String? message;
  Data? data;

  DeviceConnect({this.code, this.message, this.data});

  DeviceConnect.fromJson(Map<String, dynamic> json) {
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
  String? accessSecret;
  String? timeStamp;
  Cool? cool;

  Data({this.accessSecret, this.timeStamp, this.cool});

  Data.fromJson(Map<String, dynamic> json) {
    accessSecret = json['accessSecret'];
    timeStamp = json['timeStamp'];
    cool = json['cool'] != null ? Cool.fromJson(json['cool']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessSecret'] = accessSecret;
    data['timeStamp'] = timeStamp;
    if (cool != null) {
      data['cool'] = cool!.toJson();
    }
    return data;
  }
}

class Cool {
  String? serviceName;
  String? placement;

  Cool({this.serviceName, this.placement});

  Cool.fromJson(Map<String, dynamic> json) {
    serviceName = json['serviceName'];
    placement = json['placement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceName'] = serviceName;
    data['placement'] = placement;
    return data;
  }
}
