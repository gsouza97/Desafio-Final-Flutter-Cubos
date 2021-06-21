import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/storage/internal_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdapter {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      print(_database.path);
      return _database;
    }
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'ma_database.db');

    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE Favorites(id NUMERIC PRIMARY KEY, favorite NUMERIC)');
      },
      version: 1,
    );
  }

  // Função para salvar o filme favorito
  @override
  void saveFav(Movie movie) async {
    int favorite;
    movie.isFavorite ? favorite = 1 : favorite = 0;

    final Database db = await database;

    await db.insert('Favorites', {'id': movie.id, 'favorite': favorite});
    print('Favorito salvo no DB');
    print('${movie.id} $favorite');
  }

  // Função para apagar o filme favorito
  @override
  void deleteFav(Movie movie) async {
    final Database db = await database;

    await db.delete('Favorites', where: 'id = ?', whereArgs: [movie.id]);
    print('Favorito deletado');
    print(movie.id);
  }
}
