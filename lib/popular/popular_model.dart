import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/utils/api.dart';

class PopularModel {
  Future<Movies> _movies;
  int page = 1;

  Future<Movies> get movies {
    return _movies;
  }

  getPopularMovies() {
    _movies = API().getMovies('popular', page);
  }
}
