import 'package:cubit_notes/helper/db_helper.dart';

class noteModel {
  int? nID;
  String nTitle;
  String nDesc;
  bool isCompleted;

  noteModel({this.nID, required this.nTitle, required this.nDesc,required this.isCompleted});

  ///Goto ui from Database
  static fromMap(Map<String, dynamic> fmap) {
    return noteModel(
        nID: fmap[dbHelper.COLUMN_ID],
        nTitle: fmap[dbHelper.COLUMN_TITLE],
        nDesc: fmap[dbHelper.COLUMN_DESC],
        isCompleted: fmap[dbHelper.COLUMN_ISCOMPLETED]==0 ? false: true);
  }
///Goto DataBase
  Map<String, dynamic> toMap() {
    return {
      dbHelper.COLUMN_TITLE :nTitle,
      dbHelper.COLUMN_DESC:nDesc,
      dbHelper.COLUMN_ISCOMPLETED:isCompleted ? 1 : 0 ,
    };
  }
}
