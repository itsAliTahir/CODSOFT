import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../models/datamodels.dart';

var db;
void dBmaker() async {
  WidgetsFlutterBinding.ensureInitialized();
  //connection and creation
  db = openDatabase(
    join(await getDatabasesPath(), 'TasksDB'),
    onCreate: (db, ver) {
      return db.execute(
        '''
      CREATE TABLE Tasks (
        Title TEXT NOT NULL,
        Description TEXT,
        Category TEXT,
        isCompleted INTEGER,
        Repeat INTEGER
      )
    ''',
      );
    },
    //version is used to execute onCreate and make database upgrades and downgrades.
    version: 1,
  );
}

Future<List<MyTasks>> getData() async {
  final curDB = await db;
  //query to get all students into a Map list
  final List<Map<String, dynamic>> taskMaps = await curDB.query('Tasks');
  //converting the map list to student list
  List<MyTasks> initialList = [];
  for (var taskMap in taskMaps) {
    initialList.add(MyTasks(
      taskMap['Title'],
      taskMap['Description'],
      taskMap['Category'],
      taskMap['isCompleted'],
      false,
      taskMap['Repeat'],
    ));
  }
  return initialList;
}

Future<void> insertStudent(MyTasks myTask) async {
  //local database variable
  final curDB = await db;
  //insert function
  await curDB.insert(
    //first parameter is Table name
    'Tasks',
    //second parameter is data to be inserted
    myTask.mapTask(),
    //replace if two same entries are inserted
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
