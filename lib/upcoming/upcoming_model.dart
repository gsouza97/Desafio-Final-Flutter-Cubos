import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/utils/api.dart';

class UpComingModel {
  Future<Movies> _movies;
  int page = 1;

  Future<Movies> get movies {
    return _movies;
  }

  getUpComingMovies() {
    _movies = API().getMovies('upcoming', page);
  }
}
