import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/model.dart';

class dbHelper{

  static const String TABLE_NAME = "notes";
  static const String COLUMN_ID = "nID";
  static const String COLUMN_TITLE = "nTitle";
  static const String COLUMN_DESC = "nDesc";
  static const String COLUMN_ISCOMPLETED = "isCompleted";

  dbHelper._();
  static dbHelper getIns() => dbHelper._();

  Database? _Db;

  Future<Database>getDb()async{
    _Db ??= await createDb();
     return _Db!;
  }


  Future<Database>createDb()async{

    Directory appDoc = await getApplicationDocumentsDirectory();
    String dbPath = join(appDoc.path,"notesDB.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db,version){
      db.execute("CREATE TABLE $TABLE_NAME ($COLUMN_ID integer primary key autoincrement,$COLUMN_TITLE text,$COLUMN_DESC text,$COLUMN_ISCOMPLETED integer)");
    });
  }

  Future<bool> addNote({required noteModel newModel})async{
    Database db = await getDb();

    int rowsEffected =await db.insert(TABLE_NAME, newModel.toMap());
    return rowsEffected>0;

  }
  Future<bool>updateIsCompleted ({required nId,required isComplete})async{
    Database db = await getDb();
    int rowsEffected = await db.update(TABLE_NAME, {
      COLUMN_ISCOMPLETED:isComplete
    },where: "$COLUMN_ID=?",whereArgs: ["$nId"]);
    return rowsEffected>0;
  }
  Future<bool>updateTodo({required nId,required nTitle,required nDesc})async{
    Database db = await getDb();
    int rowsEffected = await db.update(TABLE_NAME, {COLUMN_ID:nId,COLUMN_TITLE:nTitle,COLUMN_DESC:nDesc},where: "$COLUMN_ID=?",whereArgs: ["$nId"]);
    return rowsEffected>0;
  }
  Future<bool>deleteTodo({required nId})async{
    Database db = await getDb();
    int rowsEffected = await db.delete(TABLE_NAME,where: "$COLUMN_ID=?",whereArgs: ["$nId"]);
    return rowsEffected>0;
  }

  Future<List<noteModel>> fetchAllNotes()async{
    var db = await getDb();
    List<Map<String,dynamic>> mNotes = await db.query(TABLE_NAME);

    List<noteModel> allNotes = [];

    /// Using for-each loop for insert data map to model
    for(Map<String,dynamic>eachNote in mNotes){
      allNotes.add(noteModel.fromMap(eachNote));
    }

    return allNotes;
  }


}