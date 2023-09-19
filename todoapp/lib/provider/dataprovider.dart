import 'package:flutter/material.dart';
import '../constants.dart';
import '../helper/databasehelper.dart';
import '../models/datamodels.dart';

class ProviderClass with ChangeNotifier {
  int selectedMethod = -1;
  final List<MyTasks> _myTasksList = [
    MyTasks("Dentist appointment", " ", "-1------", 1, false, 0),
    MyTasks(
        "Groceries", "Pasta Sauce, Noodles, Milk,", "---3----", 0, false, 0),
    MyTasks("Meeting with client", "2:00 PM in the Office", "----456-", 0,
        false, 1),
    MyTasks("Gym", "At 8:30 PM", "-12-----", 0, false, 1),
  ];

  final List<Categories> _myCategoriesList = [
    Categories("Work", false, itemColor1, 0),
    Categories("Health", false, itemColor2, 0),
    Categories("Personal", false, itemColor3, 0),
    Categories("Shopping", false, itemColor4, 0),
    Categories("Travel", false, itemColor5, 0),
    Categories("Social", false, itemColor6, 0),
    Categories("Others", false, itemColor7, 0),
  ];

  void listInitializer() {
    Future<List<MyTasks>> tempList = getData();

    notifyListeners();
  }

  List<MyTasks> get tasks {
    _myTasksList.sort((a, b) => a.isCompleted.compareTo(b.isCompleted));
    return [..._myTasksList];
  }

  List<Categories> get categories {
    return [..._myCategoriesList];
  }

  addItems(MyTasks inputItems) {
    //
    _myTasksList.add(inputItems);
    insertStudent(inputItems);
    notifyListeners();
    //
  }

  void updateItem(MyTasks inputItems, int index) {
    for (int i = 0; i < _myTasksList.length; i++) {
      _myTasksList[i].isSelected = false;
    }
    _myTasksList[index].isCompleted = inputItems.isCompleted;
    _myTasksList[index].isSelected = inputItems.isSelected;
    notifyListeners();
  }

  void editItem(MyTasks inputItems, int index) {
    _myTasksList[index] = inputItems;
    notifyListeners();
  }

  void deleteItem(int index) {
    _myTasksList.removeAt(index);
    notifyListeners();
  }

  int countCategories() {
    int tasksLeft = 0;
    for (int i = 0; i < _myCategoriesList.length; i++) {
      _myCategoriesList[i].quantity = 0;
    }

    for (int i = 0; i < _myTasksList.length; i++) {
      if (_myTasksList[i].isCompleted == 0) {
        tasksLeft++;
      }
      for (int j = 0; j < _myCategoriesList.length; j++) {
        for (int k = 0; k < _myTasksList[i].category.length; k++) {
          if (_myTasksList[i].category[k] != "-") {
            if (int.parse(_myTasksList[i].category[k]) == j) {
              _myCategoriesList[j].quantity++;
            }
          }
        }
      }
    }
    return tasksLeft;
  }

  void selectCategory(int index) {
    for (int i = 0; i < _myTasksList.length; i++) {
      _myTasksList[i].isSelected = false;
    }
    if (index == -2) {
      for (int i = 0; i < _myCategoriesList.length; i++) {
        _myCategoriesList[i].isSelected = false;
      }
      selectedMethod = -1;
      notifyListeners();
      return;
    }
    if (_myCategoriesList[index].isSelected == true) {
      _myCategoriesList[index].isSelected = false;
      selectedMethod = -1;
      notifyListeners();
      return;
    }
    for (int i = 0; i < _myCategoriesList.length; i++) {
      _myCategoriesList[i].isSelected = false;
    }
    _myCategoriesList[index].isSelected = true;
    selectedMethod = index;
    notifyListeners();
    return;
  }

  void khali() {}
}
