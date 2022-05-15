// https://pub.dev/packages/event_bus
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

// 使用

// 整个事件的类(可多个)：UserLoggedInEvent
// class UserLoggedInEvent {
//   User user;
//   UserLoggedInEvent(this.user);
// }

// 监听事件
// eventBus.on<UserLoggedInEvent>().listen((event) {});

// 发射事件
// eventBus.fire(UserLoggedInEvent(myUser))