import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../models/datamodels.dart';

var db;
void dBhelper() async {
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
