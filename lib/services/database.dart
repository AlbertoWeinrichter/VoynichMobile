import 'package:voynich_mobile/models/user.dart';
import 'package:voynich_mobile/services/firestore_service.dart';
import 'package:voynich_mobile/utils/paths.dart';
import 'package:flutter/material.dart';

abstract class Database {
  Stream<List<User>> userStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({
    @required this.uid,
  }) : assert(uid != null);

  final _service = FirestoreService.instance;
  final String uid;

  @override
  Stream<List<User>> userStream() => _service.collectionStream(
        path: APIPath.users(),
        builder: (data) => User.fromMap(data),
      );
}
