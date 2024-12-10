import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class DbHelper {
  ///singelton object
  /// created private constructor because we have to block that multiple instance of our dbclass has to be formed
  ///
  DbHelper._();
  ///now created one instance becuase we have to use that instance lator for doing crud operation
  ///static are the one which meomory is allocated at run time
  static DbHelper getInstance() {
    return DbHelper._();
  }
  static final String TABLE_NOTE = "note";
  static final String Column_NOTE_SERIALNO = "sr_no";
  static final String Column_NOTE_TITLE = "title";
  static final String Column_NOTE_DESC = "desc";
  ///db open (if already exists then work on it otherwise create new one)
  Database? myDB;
  get rowEFFects => null;
  Future<Database> getDB() async {
    //another shorter way
    // myDB ??= await openDB();
    // return myDB!;
      if(myDB!=null){
        return myDB!;
      }
      else{
        myDB = await openDB();
        return myDB!;
      }
  }
  Future<Database> openDB() async {
    ///Now we need two packages path provider and path
    ///pathprovider package is used to get user directory
    ///path package is used to link our own path to directory of the program
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");

    return await openDatabase(dbPath, onCreate: (db, version) {
      /// create all of your database tables here
      /// if you want to excute directory
      //  db.execute("create table note (sr_no integer primary key autoincrement )");
      db.execute(
          "create table $TABLE_NOTE($Column_NOTE_SERIALNO integer primary key autoincrement, $Column_NOTE_TITLE text, $Column_NOTE_DESC text)");
    }, version: 1);
  }
  //all queries
//insertion
  Future<bool> addNote({required String mTile, required String mDesc}) async {
    var db = await getDB();

    db.insert(TABLE_NOTE, {
      Column_NOTE_TITLE: mTile,
      Column_NOTE_DESC: mDesc,
    });
    return 0 < rowEFFects;
  }
//reading all data
  Future getAllNotes() async {
    var db = await getDB();
    //select *all from table
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }
}
