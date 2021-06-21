import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/utils/api.dart';

class TopRatedModel {
  Future<Movies> _movies;
  int page = 1;

  Future<Movies> get movies {
    return _movies;
  }

  getTopRatedMovies() {
    _movies = API().getMovies('top_rated', page);
  }
}
