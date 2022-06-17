class GetNewVersion {
  int? code;
  String? message;
  Data? data;
  List? nullInfo;

  GetNewVersion({this.code, this.message, this.data});

  GetNewVersion.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    data = json['data'] != null && (json['data'].runtimeType == List<dynamic>) ? Data.fromJson(json['data']) : null;
  }

  dynamic toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
      return data;
    } else {
      data['data'] = nullInfo;
      return data;
    }
  }
}

class Data {
  String? id;
  String? client;
  String? platform;
  String? versionCode;
  String? message;
  String? url;
  bool? isForceUpdate;
  bool? isBlocked;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.client,
      this.platform,
      this.versionCode,
      this.message,
      this.url,
      this.isForceUpdate,
      this.isBlocked,
      this.isPublished,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client = json['client'];
    platform = json['platform'];
    versionCode = json['versionCode'];
    message = json['message'];
    url = json['url'];
    isForceUpdate = json['isForceUpdate'];
    isBlocked = json['isBlocked'];
    isPublished = json['isPublished'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client'] = client;
    data['platform'] = platform;
    data['versionCode'] = versionCode;
    data['message'] = message;
    data['url'] = url;
    data['isForceUpdate'] = isForceUpdate;
    data['isBlocked'] = isBlocked;
    data['isPublished'] = isPublished;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
