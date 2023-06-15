import 'package:homeiot/profile.dart';
import 'package:homeiot/home.dart';
import 'package:homeiot/schedules.dart';
import 'package:homeiot/settings.dart';
import 'package:homeiot/notifications.dart';
import 'package:homeiot/stats.dart';

typedef T Constructor<T>();

final Map<String, Constructor<dynamic>> _constructors = <String, Constructor<dynamic>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Profile>(() => Profile());
    register<Notifications>(() => Notifications());
    register<Stats>(() => Stats());
    register<Schedules>(() => Schedules());
    register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]?.call();
  }
}

// typedef T Constructor<T>();

// final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

// void register<T>(Constructor<T> constructor) {
//   _constructors[T.toString()] = constructor;
// }

// class ClassBuilder {
//   static void registerClasses() {
//     register<Home>(() => Home());
//     register<Profile>(() => Profile());
//     register<Notifications>(() => Notifications());
//     register<Stats>(() => Stats());
//     register<Schedules>(() => Schedules());
//     register<Settings>(() => Settings());
//   }

//   static dynamic fromString(String type) {
//     return _constructors[type]();
//   }
// }