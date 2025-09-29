import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '/model/kyc_model.dart';

class KycDbHelper {
  static final KycDbHelper _instance = KycDbHelper._internal();
  factory KycDbHelper() => _instance;
  KycDbHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'kyc.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE kyc(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          hospitalName TEXT,
          doctorName TEXT,
          specialization TEXT,
          hospitalType TEXT,
          country TEXT,
          state TEXT,
          city TEXT,
          hospitalAddress TEXT,
          contact TEXT,
          email TEXT,
          notes TEXT
        )
      ''');
      print('Database created with KYC table.');
    });
  }

  Future<int> insertKyc(KycModel kyc) async {
    final db = await database;
    final id = await db.insert('kyc', kyc.toMap());
    print('Inserted KYC with id: $id, data: ${kyc.toMap()}');
    return id;
  }

  Future<int> updateKyc(KycModel kyc) async {
    final db = await database;
    final count = await db.update('kyc', kyc.toMap(), where: 'id = ?', whereArgs: [kyc.id]);
    print('Updated KYC id: ${kyc.id}, data: ${kyc.toMap()}, affected rows: $count');
    return count;
  }

  Future<int> deleteKyc(int id) async {
    final db = await database;
    final count = await db.delete('kyc', where: 'id = ?', whereArgs: [id]);
    print('Deleted KYC with id: $id, affected rows: $count');
    return count;
  }

  Future<List<KycModel>> getAllKycs() async {
    final db = await database;
    final maps = await db.query('kyc', orderBy: 'id DESC');
    final kycs = maps.map((map) => KycModel.fromMap(map)).toList();
    print('Fetched ${kycs.length} KYC records:');
    for (var kyc in kycs) {
      print(kyc.toMap());
    }
    return kycs;
  }
}
