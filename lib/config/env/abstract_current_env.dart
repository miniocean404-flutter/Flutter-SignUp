import 'dart:ui';

abstract class CurrentEnv {
  late String baseUrl = '';
  late String channel = '';

  // set get 只供外部使用,其他类及自身无法调用
  String get getBaseUrl => baseUrl;

  set setBaseUrl(url) => {baseUrl = url};

  String get getChannel => channel;

  set setChannel(value) => {channel = value};

  @override
  String toString() => '$runtimeType: (CurrentEnv baseUrl-$baseUrl channel-$channel)';

  // operator== hashCode只是写这里为了查看
  @override
  bool operator ==(other) {
    // 检查两个引用是否指向同一个对象
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;

    final dynamic typedOther = other;

    return typedOther.baseUrl == baseUrl && typedOther.channel == channel;
  }

  // 此对象的哈希码。
  // 就像默认的[operator ==]实现只在对象相同时认为它们是相等的
  // 如果[operator ==]被重写以使用对象状态，则必须更改哈希代码以表示该状态，否则该对象不能用于默认的[Set]和[Map]实现等基于哈希的数据结构中
  // 对于根据[operator ==]相等的对象，哈希码必须相同。对象的哈希码只应在对象以影响相等性的方式更改时才更改
  // 不相等的对象可以具有相同的码。允许所有实例具有相同的哈希代码，但如果冲突发生得太频繁，会降低基于哈希的数据结构(如[HashSet]或[HashMap])的效率
  // 如果一个子类重写[hashCode]，它也应该重写[operator ==]操作符以保持一致性。
  @override
  int get hashCode => hashValues(baseUrl, channel);
}
