import 'package:fhe_template/model/Product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProduct {
  static final DbProduct _instance = DbProduct._internal();
  static Database? _database;

  //inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tableProduct';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnPrice = 'price';
  final String columnDescription = 'description';

  DbProduct._internal();
  factory DbProduct() => _instance;

  //cek apakah database ada
  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'product.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnName TEXT,"
        "$columnPrice INTEGER,"
        "$columnDescription TEXT)";
    await db.execute(sql);
  }

  //insert ke database
  Future<int?> saveProduct(Product product) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, product.toMap());
  }

  //read database
  Future<List?> getAllProduct() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnPrice,
      columnDescription,
    ]);

    return result.toList();
  }

  //update database
  Future<int?> updateProduct(Product product) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, product.toMap(),
        where: '$columnId = ?', whereArgs: [product.id]);
  }

  //hapus database
  Future<int?> deleteProduct(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
