class HistoryVersion {
  int? code;
  String? message;
  Data? data;

  HistoryVersion({this.code, this.message, this.data});

  // 将map的数据添加到实体上
  HistoryVersion.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  // 将实体的数据转为map
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
  List<ListArray>? listArray;
  int? count;

  Data({this.listArray, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      listArray = <ListArray>[];
      json['list'].forEach((v) {
        listArray!.add(ListArray.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listArray != null) {
      data['list'] = listArray!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class ListArray {
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

  ListArray(
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

  ListArray.fromJson(Map<String, dynamic> json) {
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
