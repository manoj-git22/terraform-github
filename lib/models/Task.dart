import 'package:flutter/foundation.dart';

class Task {
  String id;
  String title;
  String description;
  String priority;
  String category;
  DateTime date;
  bool isCompleted;

  Task(
      {@required this.id,
      @required this.date,
      this.category,
      this.description,
      this.priority,
      this.isCompleted,
      @required this.title});
}
