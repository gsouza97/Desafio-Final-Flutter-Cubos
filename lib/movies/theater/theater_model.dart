import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/storage/internal_storage.dart';
import 'package:movies_app/storage/sql_adapter.dart';
import 'package:movies_app/utils/api.dart';

class TheaterModel {
  Future<Movies> _movies;
  int page = 1;

  final InternalStorageAdapter internalStorage;
  TheaterModel({InternalStorageAdapter internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SQLAdapter();

  Future<Movies> get movies {
    return _movies;
  }

  getTheaterMovies() {
    _movies = API().getMovies('now_playing', page);
  }

  void saveFav(Movie movie) {
    if (movie.id != null && movie.isFavorite != null) {
      internalStorage.saveFav(movie);
    }
  }

  void deleteFav(Movie movie) {
    if (movie.id != null && movie.isFavorite != null) {
      internalStorage.deleteFav(movie);
    }
  }
}
