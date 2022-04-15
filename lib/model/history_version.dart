class HistoryVersion {
  int? code;
  String? message;
  Data? data;

  HistoryVersion({this.code, this.message, this.data});

  HistoryVersion.fromJson(Map<String, dynamic> json) {
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
  List<Test>? test;
  int? count;

  Data({this.test, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['test'] != null) {
      test = <Test>[];
      json['test'].forEach((v) {
        test!.add(Test.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (test != null) {
      data['test'] = test!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Test {
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

  Test(
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

  Test.fromJson(Map<String, dynamic> json) {
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
