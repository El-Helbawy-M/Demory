import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'UserData.dart';

//============================ Fields
Database database;
//============================ End

//============================ Functions
createDB() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'MatchHistory.db'),
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE bestscores(name TEXT, gameplayed INTEGER, bestscore INTEGER , wining INTEGER , losing INTEGER)');
      await db.execute(
          'CREATE TABLE history(name TEXT, state TEXT, score INTEGER , date TEXT)');
    },
    version: 1,
  );
}

Future<void> insertData(Map<String, dynamic> map, String table) async {
  await database.insert(
    table,
    map,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getDataWithName(String table) async {
  final List<Map<String, dynamic>> list =
      await database.query(table, where: "name = ?", whereArgs: [name]);
  return list;
}

Future<List<Map<String, dynamic>>> getData(String table) async {
  final List<Map<String, dynamic>> list = await database.query(table);
  return list;
}

Future<void> updateData(Map<String, dynamic> results) async {
  //the results must be like this => {'state' : 'win , bestscores : 165}
  //================================================
  //================================================
  List<Map<String, dynamic>> list = await getDataWithName('bestscores');
  Map<String, dynamic> map = list.first,
      map2 = map.map((key, value) => MapEntry(key, value));
  (results['state'] == 'Win') ? map2['wining']++ : map2['losing']++;
  if (results['bestscore'] != 0) {
    if (results["bestscore"] < map2['bestscore'] || map2['bestscore'] == 0)
      map2['bestscore'] = results['bestscore'];
  }
  map2['gameplayed']++;
  //================================================
  //================================================
  await database.update(
    'bestscores',
    map2,
    where: "name = ?",
    whereArgs: [name],
  );
  //================================================
  //================================================
}

Future<bool> deleteData([int id]) async {
  await database.delete(
    'history',
    where: (id == null) ? null : "id = ?",
    whereArgs: (id == null) ? null : [id],
  );
  return true;
}
//============================ End
