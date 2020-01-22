import 'dart:core';


class APIPath {
  static String user(String uid) => 'users/$uid';
  static String users() => 'users';

  static String event(String eventId) => 'events/$eventId';
  static String events() => 'events';

  static String group(String uid, String eventId) => 'users/$uid/events/$eventId';
  static String groups() => 'groups/';
}