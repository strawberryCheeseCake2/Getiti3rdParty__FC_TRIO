import 'package:flutter/cupertino.dart';

class ToDo {
  late int id;
  late String title;
  late String? content;

  ToDo({id, required this.title, this.content}) {
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
      'content': content,
    };
  }

  @override
  String toString() {
    return 'ToDo{id: $id, title: $title, content: $content}';
  }
}