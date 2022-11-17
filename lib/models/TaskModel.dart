import 'package:flutter/material.dart';
import 'Task.dart';

class TaskModel extends ChangeNotifier {
  List<Task> _tasklist = [];
  List<String> _categoryList = ['Home', 'Personal', 'Work'];
  List<String> prioritylist = ['High', 'Medium', 'Low'];

  List<Task> get completedlist =>
      (tasklist.where((element) => element.isCompleted == true).toList());
  List<Task> get tasklist => (_tasklist);
  List<String> get categorylist => (_categoryList);

  addtask(String title, String id, DateTime seldate, String category,
      String priority) {
    if (title.length > 0) {
      tasklist.add(Task(
          id: id,
          date: seldate,
          title: title,
          category: category,
          isCompleted: false,
          priority: priority));
    }

    notifyListeners();
  }

  removeTask(String id) {
    tasklist.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  addcategory(String title) {
    categorylist.add(title);
    notifyListeners();
  }

  deletecategory(String id) {
    categorylist.removeWhere((element) => element == id);
    notifyListeners();
  }

  removeCategoryTask(String id) {
    tasklist.removeWhere((element) => element.category == id);
    notifyListeners();
  }

  completed(String id) {
    tasklist.forEach((element) {
      if (element.id == id) element.isCompleted = !element.isCompleted;
      notifyListeners();
    });
  }
}
