import 'dart:convert';

/// code : "0"
/// message : "查询到以下版本"
/// data : {"list":[{"id":"r89AZhbVzXc8HlwGIzEkX","client":"envoy","platform":"iOS","versionCode":"1.1.0","message":"","url":"","isForceUpdate":"","isBlocked":"","isPublished":"","createdAt":"2022-04-06T09:05:50.000Z","updatedAt":"2022-04-06T09:05:50.000Z"}],"count":"4"}

HistoryVersion historyVersionFromJson(String str) =>
    HistoryVersion.fromJson(json.decode(str));
String historyVersionToJson(HistoryVersion data) => json.encode(data.toJson());

class HistoryVersion {
  HistoryVersion({
    String? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  HistoryVersion.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _code;
  String? _message;
  Data? _data;
  HistoryVersion copyWith({
    String? code,
    String? message,
    Data? data,
  }) =>
      HistoryVersion(
        code: code ?? _code,
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// list : [{"id":"r89AZhbVzXc8HlwGIzEkX","client":"envoy","platform":"iOS","versionCode":"1.1.0","message":"","url":"","isForceUpdate":"","isBlocked":"","isPublished":"","createdAt":"2022-04-06T09:05:50.000Z","updatedAt":"2022-04-06T09:05:50.000Z"}]
/// count : "4"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    List<ListArray>? listarray,
    String? count,
  }) {
    _listarray = listarray;
    _count = count;
  }

  Data.fromJson(dynamic json) {
    if (json['list'] != null) {
      _listarray = [];
      json['list'].forEach((v) {
        _listarray?.add(ListArray.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<ListArray>? _listarray;
  String? _count;
  Data copyWith({
    List<ListArray>? listarray,
    String? count,
  }) =>
      Data(
        listarray: listarray ?? _listarray,
        count: count ?? _count,
      );
  List<ListArray>? get listarray => _listarray;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_listarray != null) {
      map['list'] = _listarray?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }
}

/// id : "r89AZhbVzXc8HlwGIzEkX"
/// client : "envoy"
/// platform : "iOS"
/// versionCode : "1.1.0"
/// message : ""
/// url : ""
/// isForceUpdate : ""
/// isBlocked : ""
/// isPublished : ""
/// createdAt : "2022-04-06T09:05:50.000Z"
/// updatedAt : "2022-04-06T09:05:50.000Z"

ListArray listArrayFromJson(String str) => ListArray.fromJson(json.decode(str));
String listArrayToJson(ListArray data) => json.encode(data.toJson());

class ListArray {
  ListArray({
    String? id,
    String? client,
    String? platform,
    String? versionCode,
    String? message,
    String? url,
    String? isForceUpdate,
    String? isBlocked,
    String? isPublished,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _client = client;
    _platform = platform;
    _versionCode = versionCode;
    _message = message;
    _url = url;
    _isForceUpdate = isForceUpdate;
    _isBlocked = isBlocked;
    _isPublished = isPublished;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ListArray.fromJson(dynamic json) {
    _id = json['id'];
    _client = json['client'];
    _platform = json['platform'];
    _versionCode = json['versionCode'];
    _message = json['message'];
    _url = json['url'];
    _isForceUpdate = json['isForceUpdate'];
    _isBlocked = json['isBlocked'];
    _isPublished = json['isPublished'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _client;
  String? _platform;
  String? _versionCode;
  String? _message;
  String? _url;
  String? _isForceUpdate;
  String? _isBlocked;
  String? _isPublished;
  String? _createdAt;
  String? _updatedAt;
  ListArray copyWith({
    String? id,
    String? client,
    String? platform,
    String? versionCode,
    String? message,
    String? url,
    String? isForceUpdate,
    String? isBlocked,
    String? isPublished,
    String? createdAt,
    String? updatedAt,
  }) =>
      ListArray(
        id: id ?? _id,
        client: client ?? _client,
        platform: platform ?? _platform,
        versionCode: versionCode ?? _versionCode,
        message: message ?? _message,
        url: url ?? _url,
        isForceUpdate: isForceUpdate ?? _isForceUpdate,
        isBlocked: isBlocked ?? _isBlocked,
        isPublished: isPublished ?? _isPublished,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  String? get id => _id;
  String? get client => _client;
  String? get platform => _platform;
  String? get versionCode => _versionCode;
  String? get message => _message;
  String? get url => _url;
  String? get isForceUpdate => _isForceUpdate;
  String? get isBlocked => _isBlocked;
  String? get isPublished => _isPublished;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['client'] = _client;
    map['platform'] = _platform;
    map['versionCode'] = _versionCode;
    map['message'] = _message;
    map['url'] = _url;
    map['isForceUpdate'] = _isForceUpdate;
    map['isBlocked'] = _isBlocked;
    map['isPublished'] = _isPublished;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
