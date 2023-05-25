import 'package:flutter/cupertino.dart';

class ToDo {
  late String title;
  late int id;

  ToDo({id, required this.title}) {
    if (id != null) {
      this.id = id;
    } else {
      this.id = UniqueKey().hashCode;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'ToDo{id: $id, title: $title}';
  }
}