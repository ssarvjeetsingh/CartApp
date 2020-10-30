import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart'as path;
import 'package:sqflite/sqflite.dart';
class DbHelper{

  static Future<Database> getDataBase()async {

    final dbPath=await sql.getDatabasesPath(); //geting path of db
    return sql.openDatabase(path.join(dbPath,"vifo"),version: 1,
        onCreate:(db,version){
          return db.execute('CREATE TABLE carto(id TEXT PRIMARY KEY,title TEXT,price TEXT,image TEXT,cart TEXT)');
        }); //opening AND creating the db
  }
  static Future<void> insert(String Table,Map<String,dynamic> data)async{
    final db= await DbHelper.getDataBase();
    print(db);
    db.insert(Table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String,dynamic>>> getData(String table)async{
    final db= await DbHelper.getDataBase();
    return db.query(table);
  }
  static Future<void> updateStatus(String table,String id,String status)async{
    final db=await DbHelper.getDataBase();
    await  db.update(
        table,{"cart":status}, where: 'id= ?', whereArgs: [id]);

    print("updated");
  }

}