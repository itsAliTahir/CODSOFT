import 'package:flutter/material.dart';

class MyTasks {
  String title;
  String description;
  String category;
  int isCompleted; // 0 = false, 1 = true
  bool isSelected;
  int repeatType; // 0 = one time, 1 = daily, 2 = weekdays, 3 = weekend
  MyTasks(this.title, this.description, this.category, this.isCompleted,
      this.isSelected, this.repeatType);
  Map<String, dynamic> mapTask() {
    return {
      'Title': title,
      'Description': description,
      'Category': category,
      'isCompleted': isCompleted,
      'Repeat': repeatType,
    };
  }
}

class Categories {
  String title;
  bool isSelected;
  Color myColor;
  int quantity;
  Categories(
    this.title,
    this.isSelected,
    this.myColor,
    this.quantity,
  );
}

List<String> list = <String>['One Time', 'Daily', 'Weekdays', 'Weekend'];
