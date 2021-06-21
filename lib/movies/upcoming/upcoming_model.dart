import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/storage/internal_storage.dart';
import 'package:movies_app/storage/sql_adapter.dart';
import 'package:movies_app/utils/api.dart';

class UpComingModel {
  Future<Movies> _movies;
  int page = 1;

  final InternalStorageAdapter internalStorage;
  UpComingModel({InternalStorageAdapter internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SQLAdapter();

  Future<Movies> get movies {
    return _movies;
  }

  getUpComingMovies() {
    _movies = API().getMovies('upcoming', page);
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
